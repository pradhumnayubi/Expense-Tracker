class ExpenseReport < ApplicationRecord
  belongs_to :employee
  has_many :expenses
  has_many :comments, as: :commentable, dependent: :destroy

  validates :status, :employee_id , presence: true
end
