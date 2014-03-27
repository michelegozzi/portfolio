class SkillsetsController < ApplicationController
  helper_method :sort_column, :sort_direction

  before_filter :signed_user

  def index
    @skillsets = Skillset.order(sort_column + " " + sort_direction).paginate(page: params[:page], :per_page => 20)
  end

  def create
    @skillset = Skillset.new(params[:skillset])
    if @skillset.save
      flash[:success] = "Skillset created!"
      redirect_to skillsets_path
    else
      render 'new'
    end
  end

  def edit
    @skillset = Skillset.find(params[:id])
  end

  def update
    @skillset = Skillset.find(params[:id])
    
    if @skillset.update_attributes(params[:skillset])
      flash[:success] = "Skillset updated"
      redirect_to skillsets_path
    else
      render 'edit', params[:skillset]
    end
  end

  def destroy
    @skillset = Skillset.find(params[:id])
    @skillset.destroy
    flash[:success] = "Skillset destroyed."
    redirect_to skillsets_path
  end

  def new
    @skillset = Skillset.new
  end

  private
    def signed_user
      redirect_to(root_path) unless signed_in?
    end

    def sort_column
      Skillset.column_names.include?(params[:sort]) ? params[:sort] : "name"
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end
end