class EmployeesController < ApplicationController
  before_action :set_employee, only: [:edit, :update, :show, :destroy]
  
  def index
    @employees = Employee.all.paginate(page: params[:page], per_page: 5)
  end
  
  def search
    @employee_search_text = params[:employee_search_text]
    @employees = nil
    if @employee_search_text.blank?
      #flash.now[:danger] = "Please enter search string"
      #@employees = Employee.search(params[:employee_search_text])
      @employees = Employee.where("first_name || last_name LIKE ?", "%#{@employee_search_text}%").paginate(page: params[:page], per_page: 5)
    else
      @employees = Employee.where("first_name || last_name LIKE ?", "%#{@employee_search_text}%").paginate(page: params[:page], per_page: 5)
      if @employees.empty?
        @employees = nil
        flash.now[:danger] = "No employee found"
      end
    end
    render 'employees/index'
  end
  
  def new
    @employee = Employee.new
    render 'edit'
  end
  
  def create
    @employee = Employee.new(employee_params)
    if @employee.save
      flash.now[:success] = "Employee has been created successfully"
    end
    render 'edit'
  end
  
  def edit
  end
  
  def show
  end
  
  def update
    if @employee.update(employee_params)
      flash.now[:success] = "Employee has been updated successfully"
      render 'edit'
    else
      render 'edit'
    end
  end

  private
    def set_employee
      @employee = Employee.find(params[:id])
    end
    
    def employee_params
      params.require(:employee).permit(:first_name, :last_name, :middle_name, :email, :flsa_status, :date_of_birth, :work_location,
                                        :street, :zip_code, :country, :home_tel, :cell_tel, :private_email, :emergency_contact_name,
                                        :emergency_contact_tel, :emergency_contact_email)
    end
end