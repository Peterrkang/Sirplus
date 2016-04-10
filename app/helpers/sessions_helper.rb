module SessionsHelper

  def current_user
    if session[:user_id]
      @current_user = (Provider.find_by(id: session[:user_id]) || Shelter.find_by(id: session[:user_id]))
    end
  end



end
