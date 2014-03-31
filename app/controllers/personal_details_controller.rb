class PersonalDetailsController < ApplicationController
  before_filter :signed_user

  

  def index
    @personal_detail = PersonalDetail.first
  end

  def edit
    @personal_detail = PersonalDetail.find(params[:id])
  end

  def update
    @personal_detail = PersonalDetail.find(params[:id])
    
    if @personal_detail.update_attributes(params[:personal_detail])
      flash[:success] = "Personal Detail updated"
      redirect_to personal_details_path
    else
      render 'edit', params[:personal_detail]
    end
  end

  def new
    @personal_detail = PersonalDetail.new
  end

  def create
    @personal_detail = PersonalDetail.new(params[:personal_detail])
    if @personal_detail.save
      flash[:success] = "Personal Detail created!"
      redirect_to personal_details_path
    else
      render 'new'
    end
  end

  private
    def signed_user
      redirect_to(root_path) unless signed_in?
    end

end
