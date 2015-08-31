ActiveAdmin.register Institution do
  permit_params :title, :parent_institution_id, :description, :homepage

  index do
    selectable_column
    id_column
    column :title
    column :parent_institution
    actions
  end

  filter :title

  form do |f|
    f.inputs "Institution details" do
      f.input :title
      f.input :description
      f.input :parent_institution_id
      f.input :homepage
    end
    f.actions
  end

end
