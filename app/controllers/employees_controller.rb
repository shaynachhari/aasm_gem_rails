# app/controllers/employees_controller.rb
class EmployeesController < ApplicationController
  before_action :set_employee, only: [:show, :edit, :update, :destroy, :approve, :cancel]

  def index
    @employees = Employee.all
  end

  def show
  end

  def new
    @employee = Employee.new
  end

  def create
    @employee = Employee.new(employee_params)

    if @employee.save
      redirect_to @employee, notice: 'Employee was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @employee.update(employee_params)
      redirect_to @employee, notice: 'Employee was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @employee.destroy
    redirect_to employees_url, notice: 'Employee was successfully destroyed.'
  end

  def approve
    @employee.approve!
    redirect_to @employee, notice: 'Employee holiday approval state has been approved.'
  end

  def cancel
    @employee.cancel!
    redirect_to @employee, notice: 'Employee holiday approval state has been cancelled.'
  end

  private

  def set_employee
    @employee = Employee.find(params[:id])
  end

  def employee_params
    params.require(:employee).permit(:name, :email, :holiday_approval_state)
  end
end
