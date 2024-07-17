class ExpenseReport < ApplicationRecord
  belongs_to :employee
  has_many :expenses

  validates :status, :employee_id , presence: true
end
