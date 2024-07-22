class Employee < ApplicationRecord
  belongs_to :department
  has_many :expenses
  has_many :expense_reports

  enum role: { ADMIN: 'ADMIN', NON_ADMIN: 'NON_ADMIN' }
  
  validates :name, :email, :employment_status, :role, presence: true
end
