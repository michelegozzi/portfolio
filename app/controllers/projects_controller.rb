class ProjectsController < ApplicationController
  helper_method :sort_column, :sort_direction

  before_filter :signed_user

  after_filter :store_prev_location_and_anchor, only: [:edit]

  def save_my_previous_url
    # session[:previous_url] is a Rails built-in variable to save last url.
    session[:my_previouse_url] = URI(request.referer).path
  end

  def index
    @projects = Project.includes(:sector).order("#{sort_column} #{sort_direction}").paginate(page: params[:page], :per_page => 5)
  end

  def create
    @project = Project.new(params[:project])
    @project.create_uuid
    if @project.save
      flash[:success] = "Project created!"
      redirect_to projects_path # project_path(@project)
    else
      render 'new'
    end
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    
    if @project.update_attributes(params[:project])
      flash[:success] = "Project updated"
      redirect_back_or projects_path # @project
    else
      render 'edit', params[:project]
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    flash[:success] = "Project destroyed."
    redirect_to projects_path
  end

  def new
    @project = Project.new
  end

  def upload
    uploaded_io = params[:resource_data]
    File.open(Rails.root.join('public/assets/uploads', uploaded_io.original_filename), 'wb') do |file|
      file.write(uploaded_io.read)
    end
    #@resource_relativepath = File.join('public/assets/uploads', uploaded_io.original_filename)
    @resource_filename = uploaded_io.original_filename
    @resource_reference_field = params[:resource_reference_field]
    @result = 1
    render 'upload'
  end

  private
    def signed_user
      redirect_to(root_path) unless signed_in?
    end

    def sort_column
      !params[:sort].nil? && (Project.column_names.include?(params[:sort]) || Sector.column_names.include?(params[:sort].split('.').last)) ? params[:sort] : "name"
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
    end

    def store_prev_location_and_anchor
      store_prev_location(params[:id])
    end
end