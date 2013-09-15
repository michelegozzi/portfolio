class ResourcesController < ApplicationController
  def show
    @resource = Resource.find(params[:id])
    send_data Base64.decode64(@resource.encoded_file), :type => @resource.mime_type, :disposition => 'inline' 
  end
end
