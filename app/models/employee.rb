class Employee < ApplicationRecord
  belongs_to :department
  has_many :expenses
  has_many :expense_reports

  validates :name, :email, :employment_status, presence: true
end
