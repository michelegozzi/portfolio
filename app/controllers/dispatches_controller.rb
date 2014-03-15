class DispatchesController < ApplicationController
  def create
    @dispatch = Dispatch.new(params[:dispatch])

    if @dispatch.valid?
      UserMailer.contact_email(@dispatch).deliver
      flash[:success] = "The message has been sent!"
      render 'new'
    end
  end

  def new
    @dispatch = Dispatch.new
  end
end
