class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end 

  def create
    @user = User.new(params.require(:user).permit(:title,:start_day,:end_day,:all_day,:memo))
    if @user.save
      flash[:notice] = "created a schedule"
      redirect_to users_path
    else
      render action: :new
    end 
  end 

  def show
    @user = User.find(params[:id])
  end 

  def edit
    @user = User.find(params[:id])
  end 

  def update
    @user = User.find(params[:id])
    if @user.update(params.require(:user).permit(:title,:start_day,:end_day,:all_day,:memo))
      flash[:notice] = "ID「#{@user.id}」の情報を更新しました"
      redirect_to users_path
    else
      render action: :edit
    end 
  end 

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = "delete user"
    redirect_to users_path
  end 
end

