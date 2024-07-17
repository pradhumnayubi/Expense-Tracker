# app/controllers/departments_controller.rb
class DepartmentsController < ApplicationController
  before_action :set_department, only: [:show, :update, :destroy]

  # GET /departments
  def index
    @departments = Department.all
    render json: @departments
  end

  # GET /departments/:id
  def show
    render json: @department
  end

  # POST /departments
  def create
    @department = Department.new(department_params)

    if @department.save
      render json: @department, status: :created
    else
      render json: @department.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /departments/:id
  def update
    if @department.update(department_params)
      render json: @department
    else
      render json: @department.errors, status: :unprocessable_entity
    end
  end

  # DELETE /departments/:id
  def destroy
    @department.destroy
  end

  private

  def set_department
    @department = Department.find(params[:id])
  end

  def department_params
    params.require(:department).permit(:name)
  end
end
