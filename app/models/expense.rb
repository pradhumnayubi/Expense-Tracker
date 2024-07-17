class Expense < ApplicationRecord
  belongs_to :employee
  belongs_to :expense_report, optional: true

  validates :date, :description, :amount, :invoice_number, :supporting_document, presence: true
end
