class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  private
  def logged_in_as_correct_user?
    @user = (Provider.find_by(id: params[:id]) || Shelter.find_by(id: params[:id]))
    unless current_user.id == @user.id
      flash[:not_permitted] = "Can't access another account"
      redirect_to root_url
    end
  end

end
