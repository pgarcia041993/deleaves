class UpdatesController < ApplicationController

  def update_grade
    grade = Grade.where(id: params[:id]).last
    grade.update_attribute :whatif, params[:grade].to_d

    render :json => {'status' => 'success',
                     'old_grade' => grade.grade,
                     'new_grade' => grade.whatif}
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
    end

    render :json => {'status' => 'success',
                     'old_grade' => student.gpa,
                     'old_rank' => student.rank,
                     'new_grade' => student.whatif_gpa,
                     'new_rank' => student.whatif_rank}
  end

end