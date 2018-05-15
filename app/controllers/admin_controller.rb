class AdminController < ApplicationController

  def admin_view
      @pageNumber = 0
      @users = User.paginate(:page => params[:page], :per_page => 5)
  end

  def index
    @admins = Users.paginate(:page => params[:page], :per_page => 5)
  end

  def destroy
    UserRole.where(user_id: params[:id]).destroy_all
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to admin_path_url
  end

  def testdelete
    puts "testdelete called"
  end
end
