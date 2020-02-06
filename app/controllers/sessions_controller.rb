class SessionsController < ApplicationController

 # Create a new session for returning users
 def create
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect_to homepage_path(user)
    else
        flash[:notice] = "Sorry, we cant find a user with that username and password"
        redirect_to login_path
    end
 end

 # Delete session for logged in user
 def destroy
    session.delete(:user_id)
    session[:user_id] = nil
    redirect_to home_path
 end

end