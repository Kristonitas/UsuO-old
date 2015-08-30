class Institution < ActiveRecord::Base
  belongs_to :parent_institution, class_name: "Institution"
  has_many :child_institutions, foreign_key: "parent_institution_id", dependent: :destroy, class_name: "Institution"
  has_many :forms
end
