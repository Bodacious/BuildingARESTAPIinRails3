class UsersController < ApplicationController
  
  respond_to :html, :json, :xml
    
  def index
    respond_with users
  end

  def show
    respond_with user
  end

  def create
    user.save
    respond_with user
  end

  def update
    user.update_attributes(params[:user])
    respond_with user
  end

  def destroy
    user.destroy
    respond_with user
  end
  
  private
  
  # Make these helpers available to the view too
  helper_method :user, :users
  
  def user
    # If the action is new or create...
    if @user = params[:action] =~ /new|create/
      User.new(params[:user])
    else
      User.find(params[:id])
    end
  end

  def users
    @users = User.all
  end
  
end