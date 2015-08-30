class CreateForms < ActiveRecord::Migration
  def change
    create_table :forms do |t|
      t.integer :student_id, nil: false
      t.integer :institution_id
      t.integer :program_id
      t.string :title, nil: false
      t.text :info
      t.boolean :resolved, nil: false, default: false

      t.timestamps null: false
    end
  end
end
