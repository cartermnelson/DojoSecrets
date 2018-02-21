class SecretsController < ApplicationController
  def index
    @secrets = Secret.all
  end

  def create
    secret = Secret.new(content: params[:content], user: current_user)
    flash[:errors] = secret.errors.full_messages unless secret.save
    redirect_to "/users/#{current_user.id}"
  end

  def destroy
    Secret.find(params[:id]).destroy
    redirect_to "/users/#{current_user.id}"
  end
end
