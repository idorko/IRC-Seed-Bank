class RegistrationsController < Devise::RegistrationsController
  def new
    flash[:error] = "You shouldn't be trying to access this."
    redirect_to root_path
  end

  def create
    flash[:error] = "You shouldn't be trying to access this."
    redirect_to root_path
  end
end

