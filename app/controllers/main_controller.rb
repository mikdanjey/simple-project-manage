class MainController < ApplicationController
  
  layout "main"
  
  def index
    @projects = Project.where(users_id: current_user.id).order("updated_at DESC")
  end
  
end
