class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def new
  end
  def create
      # Log User In
    user = User.find_by_email(params[:email].downcase).try(:authenticate, params[:password])
    if user # if authenticate true
      session[:user_id] = user.id # save user id to session
      redirect_to "/users/#{user.id}" # redirect to users profile page

    else # if authenticate false
      flash[:errors] = ["Invalid Combination"] # add an error message -> flash[:errors] = ["Invalid"]
      redirect_to "/sessions/new" # redirect to login page
    end
  end

  def destroy
      # Log User out
      session[:user_id] = nil # set session[:user_id] to null
      redirect_to "/sessions/new" # redirect to login page
  end
end