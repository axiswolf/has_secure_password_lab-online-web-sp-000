class UsersController < ApplicationController

  def new

  end

  def create
    # creates a new user
    # logs you in
    # sets your password if confirmation matches
    # redirects if password and confirmation don't match
  end

  private

  def user_params
    params.require(:user).permit(:name, :password_digest)
  end
end
