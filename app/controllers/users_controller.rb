class UsersController < ApplicationController

  def index
    @pageNumber = 0
    @users = User.paginate(:page => params[:page], :per_page => 5)
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    UserRole.where(user_id: params[:id]).destroy_all
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to admin_path_url
  end

  def create
    @user = User.new(user_params)
    if @user.save
      #TODO: implement saving user
      idToAdd = UserRole.last.id + 1
      UserRole.create(id: idToAdd, user_id: @user.id, role_id: 2)

      redirect_to login_path
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
    render 'edit'
  end

  def update
    @user = User.find(params[:id])
    puts "update method called"
    params[:user].delete(:password) if params[:user][:password].blank?
    params[:user].delete(:password_confirmation) if params[:user][:password_confirmation].blank?

    if @user.update_attributes(params.require(:user).permit(:first_name, :last_name, :email))
      flash[:notice] = 'The User is successfully updated!'
      redirect_to admin_path_url
    else
      Rails.logger.info(@user.errors.messages.inspect)
      flash[:notice] = 'Error during updating'
      redirect_to edit_user_path
    end
  end

  def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
