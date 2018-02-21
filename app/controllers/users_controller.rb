class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def new
  end

  def create
    user = User.new(user_params)
    if user.save
      redirect_to "/sessions/new"
    else
      flash[:errors] = user.errors.full_messages
      redirect_to "/users/new"
    end
  end

  def show
  end

  def edit
  end

  def update
    user = User.find(params[:id])
    unless user.update(edit_params)
      flash[:errors] = user.errors.full_messages
      redirect_to "/users/#{user.id}/edit"
    else
      redirect_to "/users/#{user.id}"
    end
  end

  def destroy
    User.find(params[:id]).destroy
    session.clear
    redirect_to "/users/new"
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    def edit_params
      params.require(:user).permit(:name, :email)
    end
end
