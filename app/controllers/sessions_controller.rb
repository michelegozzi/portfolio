class SessionsController < ApplicationController

  after_filter :store_prev_location, only: [:new]
  before_filter :store_prev_location, only: [:destroy]

  def new
  end

  def create
    user = User.find_by_email(params[:email].downcase)
    if user && user.authenticate(params[:password])
      session[:user] = user.id
      sign_in user
      redirect_back_or user
    else
      flash.now[:error] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    logger.info "destroy"
    sign_out
    redirect_back_or root_url
  end

  private

    def store_prev_location_before_sign_in
      logger.debug "call store_prev_location_before_sign_in"
      #debugger
      store_prev_location(nil)
    end
end
