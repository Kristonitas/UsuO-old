class StaticPagesController < ApplicationController
  # layout "static_pages"

  def home
    @institutions = Institution.where(parent_institution_id: -1)
  end
end
