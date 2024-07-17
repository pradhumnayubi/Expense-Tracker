class ExpenseMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def expense_status_update(employee, expense)
    @employee = employee
    @expense = expense
    mail(to: @employee.email, subject: 'Expense Status Update')
  end
end
