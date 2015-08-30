class InstitutionsController < ApplicationController
  def show
    @institution = Institution.find(params[:id])
    @institutions = @institution.child_institutions

    if orange_signed_in?
      @title = 'Moksleivių'
      @forms = @institution.forms
    elsif student_signed_in?
      @title = 'Tavo'
      @forms = @institution.forms.where(student_id: current_student.id)
    end
  end
end
