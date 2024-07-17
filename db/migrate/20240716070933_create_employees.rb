class CreateEmployees < ActiveRecord::Migration[6.1]
  def change
    create_table :employees do |t|
      t.string :name
      t.string :email
      t.references :department, null: false, foreign_key: true
      t.string :employment_status
      t.timestamps
    end
  end
end
