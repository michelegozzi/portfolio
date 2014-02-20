class SessionsControllerCfgVer < ApplicationController
  def new
  end

  def create
    user = User.authenticate(params[:username], params[:password])
    if user && user.authenticated
      #debugger
      session[:user] = user.id
      sign_in user
      redirect_back_or user
    else
      flash.now[:error] = 'Invalid username/password combination'
      render 'new'
    end
  end

  def destroy
    logger.info "destroy"
    sign_out
    redirect_to root_url
  end
end
