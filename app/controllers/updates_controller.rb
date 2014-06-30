class UpdatesController < ApplicationController

  def update_grade
    grade = Grade.where(id: params[:id]).last
    grade.update_attribute :whatif, params[:grade].to_d

    render :json => {'status' => 'success',
                     'old_grade' => grade.grade,
                     'new_grade' => grade.whatif}
  end

end