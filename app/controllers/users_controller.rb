class UsersController < ApplicationController

  def new

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

    user = User.find_by(name: params[:user][:name])
    user = user.try(:authenticate, params[:user][:password])
    return redirect_to(controller: 'sessions', action: 'new') unless user
    session[:user_id] = user.id
    @user = user
    redirect_to controller: 'welcome', action: 'home'
  end

  private

  def user_params
    params.require(:user).permit(:name, :password_digest, :password_confirmation)
  end
end
