class InstitutionsController < ApplicationController
  def show
    @institution = Institution.find(params[:id])
    @institutions = @institution.child_institutions
    @forms = @institution.forms if orange_signed_in?
  end
end
