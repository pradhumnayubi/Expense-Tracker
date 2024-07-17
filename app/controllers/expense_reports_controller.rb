# app/controllers/expense_reports_controller.rb
class ExpenseReportsController < ApplicationController
  before_action :set_expense_report, only: [:show, :update, :destroy]

  # GET /expense_reports
  def index
    @expense_reports = ExpenseReport.all
    render json: @expense_reports
  end

  # GET /expense_reports/:id
  def show
    render json: @expense_report
  end

  # POST /expense_reports
  def create
    @expense_report = ExpenseReport.new(expense_report_params)

    if @expense_report.save
      render json: @expense_report, status: :created
    else
      render json: @expense_report.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /expense_reports/:id
  def update
    if @expense_report.update(expense_report_params)
      render json: @expense_report
    else
      render json: @expense_report.errors, status: :unprocessable_entity
    end
  end

  # DELETE /expense_reports/:id
  def destroy
    @expense_report.destroy
  end

  private

  def set_expense_report
    @expense_report = ExpenseReport.find(params[:id])
  end

  def expense_report_params
    params.require(:expense_report).permit(:employee_id, :status, :comments)
  end
end
