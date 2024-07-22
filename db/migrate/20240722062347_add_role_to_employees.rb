class AddRoleToEmployees < ActiveRecord::Migration[7.1]
  def change
    add_column :employees, :role, :integer, default: 1, null: false
  end
end
