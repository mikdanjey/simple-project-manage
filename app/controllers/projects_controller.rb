class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  layout "main"

  # GET /projects
  # GET /projects.json
  def index
    @projects = Project.all
  end

  # GET /projects/new
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(project_params)
    if @project.save
        gflash :success => 'Project was successfully created.'
        redirect_to projects_url
      else
        gflash :now, :error => @project.errors.full_messages.to_sentence
        render :new 
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
     if @project.update(project_params)
        gflash :success => 'Project was successfully updated.'
        redirect_to projects_url
      else
        gflash :now, :error => @project.errors.full_messages.to_sentence
        render :edit 
      end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy
    gflash :success => 'Project was successfully destroyed.'
    redirect_to projects_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      if params[:id].present?
        begin
        @project = Project.find(params[:id])
        rescue => e
          gflash:now, :error => "Project not found"
          redirect_to projects_url
        end
      else
        redirect_to projects_url
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:users_id, :categories_id, :title)
    end
end
