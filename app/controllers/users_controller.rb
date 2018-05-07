class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      #TODO: implement saving user
      idToAdd = UserRole.last.id + 1
      UserRole.create(id: idToAdd, user_id: @user.id, role_id: 2)

      redirect_to home_path
    else
      render 'new'
    end
  end

  def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
