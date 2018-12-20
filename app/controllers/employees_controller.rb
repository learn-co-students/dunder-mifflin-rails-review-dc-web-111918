class EmployeesController < ApplicationController
  def index
  @employees = Employee.all
end

def show
  @employee = Employee.find(params[:id])
end

def new
  @employee = Employee.new
end

def create
  @employee = Employee.new(strong_params)

    if @employee.save
    redirect_to employee_path(@employee)
    else
      render :new
    end
end

def edit
  @employee = Employee.find(params[:id])
end

def update
  @employee = Employee.find(params[:id])
  if @employee.update(strong_params)
  redirect_to employee_path(@employee)
  else
    render :edit
  end
end

private

def strong_params
  params.require(:employee).permit(:first_name, :last_name, :alias,
                                  :title, :office, :dog_id, :img_url)
end

end
