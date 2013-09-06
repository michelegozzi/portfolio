class SectorsController < ApplicationController
  helper_method :sort_column, :sort_direction

  before_filter :signed_user

  def index
    @sectors = Sector.order(sort_column + " " + sort_direction).paginate(page: params[:page], :per_page => 20)
  end

  #def show
  #  @sector = Sector.find(params[:id])
  #end

  def create
    @sector = Sector.new(params[:sector])
    if @sector.save
      flash[:success] = "Sector created!"
      redirect_to sectors_path # sector_path(@sector)
    else
      render 'new'
    end
  end

  def edit
    @sector = Sector.find(params[:id])
  end

  def update
    @sector = Sector.find(params[:id])
    
    if @sector.update_attributes(params[:sector])
      flash[:success] = "Sector updated"
      redirect_to sectors_path # @sector
    else
      render 'edit', params[:sector]
    end
  end

  def destroy
    @sector = Sector.find(params[:id])
    @sector.destroy
    flash[:success] = "Sector destroyed."
    redirect_to sectors_path
  end

  def new
    @sector = Sector.new
  end

  private
    def signed_user
      redirect_to(root_path) unless signed_in?
    end

    def sort_column
      Sector.column_names.include?(params[:sort]) ? params[:sort] : "description"
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
    end
end
