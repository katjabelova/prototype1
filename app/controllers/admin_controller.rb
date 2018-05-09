class AdminController < ApplicationController

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
