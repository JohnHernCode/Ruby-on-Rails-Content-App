class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(name: params[:session][:name].downcase)
    if user&.authenticate(params[:session][:password])
      log_in user
      flash[:notice] = 'You signed in successfully!'
      redirect_to root_path
    else
      flash.now[:danger] = 'Invalid name/password combination'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_path
  end
end
