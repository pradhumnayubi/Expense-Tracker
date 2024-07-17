class CreateExpenseReports < ActiveRecord::Migration[6.1]
  def change
    create_table :expense_reports do |t|
      t.references :employee, null: false, foreign_key: true
      t.string :status
      t.text :comments
      t.timestamps
    end
  end
end
