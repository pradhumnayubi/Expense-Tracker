class AddComments < ActiveRecord::Migration[7.1]
  def change
    add_reference :expense_reports, :comments
    add_reference :expenses, :comments
  end
end
