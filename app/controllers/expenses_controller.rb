class ExpensesController < ApplicationController
  before_action :set_expense, only: [:show, :update, :destroy]

  def index
    @expenses = Expense.all
    render json: @expenses
  end

  def show
    render json: @expense
  end

  def create
    @expense = Expense.new(expense_params)
    if @expense.expense_report_id.nil? || !ExpenseReport.exists?(@expense.expense_report_id)
      new_expense_report = ExpenseReport.create(employee_id: @expense.employee_id, status: 'pending')
      @expense.expense_report_id = new_expense_report.id
    else
      expense_report = ExpenseReport.find(@expense.expense_report_id)
      if expense_report.employee_id != @expense.employee_id
        render json: { error: 'Expense report belongs to a different employee' }, status: :unprocessable_entity
        return
      end
    end
    @expense.status = 'pending'
    if @expense.save
      render json: @expense, status: :created
    else
      render json: @expense.errors, status: :unprocessable_entity
    end
  end

  def update
    if @expense.update(expense_params)
      ExpenseMailer.expense_status_update(@expense.employee, @expense).deliver_now
      render json: @expense
    else
      render json: @expense.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @expense.destroy
  end

  def expenses_by_employee
    @expenses = Expense.where(employee_id: params[:employee_id])
    render json: @expenses
  end

  private

  def set_expense
    @expense = Expense.find(params[:id])
  end

  def expense_params
    params.require(:expense).permit(:employee_id, :expense_report_id, :date, :description, :amount, :invoice_number, :supporting_document)
  end
end
