class ExpenseReport < ApplicationRecord
  belongs_to :employee
  has_many :expenses

  validates :status, presence: true
end
