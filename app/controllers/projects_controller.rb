class ProjectsController < ApplicationController

  def index
    respond_to do |f|
      f.html  {render :layout => false }
      f.json  {render :json => Project.all}
    end
  end

  def show
    respond_to do |f|
      f.html  {render :layout => false }
      f.json  {render :json => Project.find(params[:id])}
    end
  end

  def create
    new_project = params.require(:project).permit(:name, :location, :description)
    project = Project.create(new_project)
    binding.pry
    respond_to do |f|
        f.html {redirect_to projects_path}
        f.json {render json: project }
    end
  end

  def update
  end

  def delete
  end

end
