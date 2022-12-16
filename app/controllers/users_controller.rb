class UsersController < ApplicationController
  def index
    @user = User.all
  end

  def show
    redirect_to new_user_session_path
  end
end
