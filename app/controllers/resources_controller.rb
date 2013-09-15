class ResourcesController < ApplicationController
  def show
    @resource = Resource.find(params[:id])

    if !@resource.nil? && !@resource.mime_type.nil? && !@resource.encoded_file.nil?
      decoded = Base64.decode64(@resource.encoded_file)
      send_data decoded, :type => @resource.mime_type, :disposition => 'inline'
    else
      msg = 'Causes: '
      if @resource.nil? 
        msg += ' [nil resource]'
      end

      if @resource.mime_type.nil?
        msg += ' [nil mime type]'
      end

      if @resource.encoded_file.nil?
        msg += ' [nil encoded file]'
      end

      flash[:error] = msg
    end
  end
end
