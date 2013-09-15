class ContactProfilesController < ApplicationController
  helper_method :sort_column, :sort_direction

  before_filter :signed_user

  def index
    @contact_profiles = ContactProfile.order(sort_column + " " + sort_direction).paginate(page: params[:page], :per_page => 20)
  end

  def create
    @contact_profile = ContactProfile.new(params[:contact_profile])
    if @contact_profile.save
      flash[:success] = "Contact Profile created!"
      redirect_to contact_profiles_path
    else
      render 'new'
    end
  end

  def edit
    @contact_profile = ContactProfile.find(params[:id])
  end

  def update
    @contact_profile = ContactProfile.find(params[:id])
    
    if @contact_profile.update_attributes(params[:contact_profile])
      flash[:success] = "Contact Profile updated"
      redirect_to contact_profiles_path
    else
      render 'edit', params[:contact_profile]
    end
  end

  def destroy
    @contact_profile = ContactProfile.find(params[:id])
    @contact_profile.destroy
    flash[:success] = "Contact Profile destroyed."
    redirect_to contact_profiles_path
  end

  def new
    @contact_profile = ContactProfile.new
  end

  private
    def signed_user
      redirect_to(root_path) unless signed_in?
    end

    def sort_column
      ContactProfile.column_names.include?(params[:sort]) ? params[:sort] : "profile_type"
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end
end
