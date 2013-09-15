class ResourcesController < ApplicationController
  def show
    @resource = Resource.find(params[:id])

    if !@resource.nil? && !@resource.mime_type.nil? && !@resource.encoded_file.nil?
      decoded = Base64.decode64(@resource.encoded_file)
      send_data decoded, :type => @resource.mime_type, :disposition => 'inline'
    else
      msg = 'Causes: ' + @resource.nil? ? 'nil resource' : ''
      msg += ', nil mime type' if @resource.mime_type.nil?
      msg += ', nil encoded file' if @resource.encoded_file.nil?
      flash[:error] = "Profile updated"
    end
  end
end
