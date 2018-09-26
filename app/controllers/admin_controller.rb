class AdminController < ApplicationController

  def admin_view
      @users = User.paginate(:page => params[:page], :per_page => 5)
  end

  def index
  #  @current_user = 
    @admins = Users.paginate(:page => params[:page], :per_page => 5)
  end

  def delete
    puts "deleting 2"
  end

  def destroy
    puts "deleting"
    UserRole.where(user_id: params[:id]).destroy_all
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to admin_path_url
  end

  def testdelete
    puts "testdelete called"
  end
end
