module SessionsHelper

  def sign_in(user)
    cookies.permanent[:remember_token] = user.remember_token
  end

  def sign_out()
    cookies.delete(:remember_token)          #no necesitas pasar usuario, porque lo único que hace es borrar a cualquiera que esté metido
  end

  def current_user
    @current_user ||= User.find_by_remember_token(cookies[:remember_token])
  end

end
