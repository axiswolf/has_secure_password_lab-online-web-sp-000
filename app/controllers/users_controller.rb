class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    # creates a new user
    # logs you in
    # sets your password if confirmation matches
    # redirects if password and confirmation don't match
    # @user = User.create(user_params)
    #
    # if params[:user][:password] != params[:user][:password_confirmation]
    #   redirect_to "/signup"
    # else
    #   @user.save
    #   session[:user_id] = @user.id
    # end
    @user = User.create(user_params)
      if @user.password == @user.password_confirmation
      session[:user_id] = @user.id
      else
        redirect_to '/signup'
      end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
