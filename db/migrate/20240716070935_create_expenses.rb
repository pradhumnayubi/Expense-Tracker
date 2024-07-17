class CreateExpenses < ActiveRecord::Migration[6.1]
  def change
    create_table :expenses do |t|
      t.references :employee, null: false, foreign_key: true
      t.references :expense_report, foreign_key: true
      t.date :date
      t.text :description
      t.decimal :amount, precision: 10, scale: 2
      t.integer :invoice_number
      t.string :supporting_document
      t.string :status
      t.timestamps
    end
  end
end
