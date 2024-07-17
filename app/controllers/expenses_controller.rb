# app/controllers/expenses_controller.rb
class ExpensesController < ApplicationController
  before_action :set_expense, only: [:show, :update, :destroy]

  # GET /expenses
  def index
    @expenses = Expense.all
    render json: @expenses
  end

  # GET /expenses/:id
  def show
    render json: @expense
  end

  # POST /expenses
  def create
    @expense = Expense.new(expense_params)
    if @expense.expense_report_id.nil? || !ExpenseReport.exists?(@expense.expense_report_id)
      new_expense_report = ExpenseReport.create(employee_id: @expense.employee_id, status: 'pending')
      @expense.expense_report_id = new_expense_report.id
    end
    validation = InvoiceValidator.validate(@expense.invoice_number)

    if validation['status']
      @expense.status = 'pending'
      if @expense.save
        render json: @expense, status: :created
      else
        render json: @expense.errors, status: :unprocessable_entity
      end
    else
      render json: { error: 'Invalid invoice number' }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /expenses/:id
  def update
    if @expense.update(expense_params)
      ExpenseMailer.expense_status_update(@expense.employee, @expense).deliver_now
      render json: @expense
    else
      render json: @expense.errors, status: :unprocessable_entity
    end
  end

  # DELETE /expenses/:id
  def destroy
    @expense.destroy
  end

  private

  def set_expense
    @expense = Expense.find(params[:id])
  end

  def expense_params
    params.require(:expense).permit(:employee_id, :expense_report_id, :date, :description, :amount, :invoice_number, :supporting_document)
  end
end
