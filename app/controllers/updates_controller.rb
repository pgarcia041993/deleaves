class UpdatesController < ApplicationController
  include ActionView::Helpers::NumberHelper

  def update_grade
    grade = Grade.where(id: params[:id]).last
    grade.update_attribute :whatif, params[:grade].to_d

    render :json => {'status' => 'success',
                     'old_grade' => grade.grade,
                     'new_grade' => grade.whatif}
  end

  def get_gpa
    students = Student.where(number: params[:id])
    total_units = 0.0
    total_gpa = 0.0

    students.each do |student|
      total_units = total_units + Termunit.where(cohort: student.cohort.to_s, term: student.term).sum(:units)
      total_gpa = total_gpa + (student.whatif_gpa.present? ? student.whatif_gpa : student.gpa)
    end

    render :json => {'status' => 'success', 'gpa' => number_with_precision((total_gpa / total_units), :precision => 2)}
  end

  def update_fail
    student = Student.where(id: params[:id]).last
    student.update_attribute :whatif_fail, params[:fail]

    render :json => {'status' => 'success',
                     'old_fail' => student.fail,
                     'new_fail' => student.whatif_fail}
  end

  def update_gpa
    student = nil
    ActiveRecord::Base.transaction do
      student = Student.where(id: params[:id]).last
      student.update_attribute :whatif_gpa, params[:gpa]
      Student.all.each { |x| x.update_attribute :whatif_gpa, (x.whatif_gpa.present? ? x.whatif_gpa : x.gpa) }
      terms = Student.all.map(&:term).uniq.reject { |x| x.nil? }
      cohorts = Student.all.map(&:cohort).uniq.reject { |x| x.nil? }

      terms.each do |term|
        cohorts.each do |cohort|
          gpas = Student.where(term: term, cohort: cohort).map(&:whatif_gpa).uniq.sort.reverse

          counter = 0
          ranks = {}

          gpas.each do |x|
            counter = counter + 1
            ranks.merge!(x.to_s => counter)
          end

          gpas.each do |gpa|
            Student.where(term: term, cohort: cohort, whatif_gpa: gpa).each { |x| x.update_attribute :whatif_rank, ranks[gpa.to_s] }
          end

          student.update_attribute :whatif_rank, ranks[student.whatif_gpa.to_s]
        end
      end

      ComputedGpa.delete_all
      Student.all.map(&:number).uniq.each do |student_number|
        next if student_number.blank?
        total_units = 0.0
        total_gpa = 0.0

        students = Student.where(number: student_number).where('term is not null')
        students.each do |student|
          total_units = total_units + Termunit.where(cohort: student.cohort.to_s, term: student.term).sum(:units)
          Rails.logger.debug(">>>>>>>>>>>>>>>>>>>>>>>> #{Termunit.where(cohort: student.cohort.to_s, term: student.term).sum(:units)}")
          unless student.gpa.blank?
            temporary_gpa = (student.whatif_gpa.present? ? student.whatif_gpa : student.gpa)
            Rails.logger.debug(">>>>>>>>>>>>>>>>>>> TEMP GPA #{temporary_gpa}")

            total_gpa = total_gpa + (temporary_gpa * Termunit.where(cohort: student.cohort.to_s, term: student.term).sum(:units))
          end
        end

        Rails.logger.debug(">>>>>>>>>>>>>>>>>>> TOTAL GPA #{total_gpa}")
        Rails.logger.debug(">>>>>>>>>>>>>>>>>>> TOTAL UNITS #{total_units}")

        unless total_units.zero? || total_gpa.zero?
          ComputedGpa.create!(student_number: student_number, computed_gpa: (total_gpa / total_units).round(2))
        end

      end

      ComputedGpa.order('computed_gpa desc').inject([]) do |gpas, compute|
        gpas << compute.computed_gpa
        compute.update_attribute :rank, gpas.uniq.count
        gpas
      end
    end

    render :json => {'status' => 'success',
                     'old_grade' => student.gpa,
                     'old_rank' => student.rank,
                     'new_grade' => student.whatif_gpa,
                     'new_rank' => student.whatif_rank}
  end


  def save_whatif

    if params[:gpa] == 10
      Student.where(:number => params[:id], :term => session[:term]).each do |student|
        student.update_attribute :whatif_gpa, nil
      end
    else
      Student.where(:number => params[:id], :term => session[:term]).each do |student|
        student.update_attribute :whatif_gpa, params[:gpa]
      end
    end

    render :json => {'status' => 'success'

    }
  end

end