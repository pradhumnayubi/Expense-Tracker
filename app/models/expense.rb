class Expense < ApplicationRecord
  belongs_to :employee
  belongs_to :expense_report, optional: true
  has_many :comments, as: :commentable, dependent: :destroy

  validates :date, :description, :amount, :invoice_number, :supporting_document, presence: true
end
