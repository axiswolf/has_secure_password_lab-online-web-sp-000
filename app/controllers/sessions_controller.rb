class SessionsController < ApplicationController

  def create
    # logs you with the correct password
    # rejects invalid passwords
    # rejects empty passwords
    @user = User.find_by(name: params[:name])
    return head(:forbidden) unless @user.authenticate(params[:password])
    session[:user_id] = @user.id
  end

end
