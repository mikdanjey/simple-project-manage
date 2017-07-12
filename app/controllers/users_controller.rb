class UsersController < ApplicationController
    
  def index
    redirect_to new_registration_path('user')
  end

  def show
    redirect_to request.referer || new_session_path('user')
  end

end
