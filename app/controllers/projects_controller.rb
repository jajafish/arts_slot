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
    # new_project = params.require(:project).permit(:name => "new Movie", :location => "0", :description => "Romantic, indie, hip, action comedy")
    project = Project.create(name: "new Movie", location: "0", description: "Romantic, indie, hip, action comedy")
    respond_to do |f|
        f.html {redirect_to projects_path}
        f.json {render json: project, status: 201 }
    end
  end

  def update
    Project.find(params[:id]).update_attributes(params.require(:project).permit(:name, :location, :description))

    render nothing: true, status: 200
  end

  def delete
  end

end
