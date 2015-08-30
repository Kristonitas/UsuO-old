class CreateInstitutions < ActiveRecord::Migration
  def change
    create_table :institutions do |t|
      t.string :title, null: false
      t.integer :parent_institution_id, null: false, default: -1
      t.text :description
      t.string :homepage

      t.timestamps null: false
    end

    add_index "institutions", ["title", "parent_institution_id"], name: "index_title_on_parent_institution_id", unique: true
  end
end
