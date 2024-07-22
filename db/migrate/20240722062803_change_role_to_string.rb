class ChangeRoleToString < ActiveRecord::Migration[7.1]
  def up
    change_column :employees, :role, :string, default: 'NON_ADMIN', null: false
    Employee.update_all(role: 'NON_ADMIN') # Ensuring existing records are updated
  end

  def down
    change_column :employees, :role, :integer, using: 'role::integer', default: 1, null: false
  end
end
