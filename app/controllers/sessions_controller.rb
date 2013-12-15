class SessionsController < ApplicationController
  skip_before_filter :authorize, only: [:new, :create]

  def new

  end

  def create
    user = User.find_by_email(params[:email]) #look for user in database
    if user && user.authenticate(params[:password]) #si no encontrara al usuario regresaría nil, y eso sería falso
      sign_in(user)     #method in sessions_helper
      redirect_to user_path(user.id)    #new session successful, send to show page
      #redirect_to message_path(user.id)

    else
      flash[:errors] = "Invalid email or password."  #Session start error
      render :new
    end
  end

  def destroy
    sign_out
    redirect_to new_session_path
  end

end
