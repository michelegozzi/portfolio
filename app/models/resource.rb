ActiveRecord::MissingAttributeError = ActiveModel::MissingAttributeError unless defined?(ActiveRecord::MissingAttributeError)

class Resource < ActiveRecord::Base
  attr_accessible :display_name, :mime_type, :file_path, :encoded_file

  belongs_to :project

  #attr_accessor :filename
  #attr_accessible :filename


  #after_initialize :set_filename
  before_destroy :remove_file
  before_save :set_mimetype
  before_save :set_encoded_file
  #after_save :move_file
  #after_save :remove_file

  private
    # Set the filename attribute
    #def set_filename
    #  if !self.file_path.nil?
    #    self.filename = File.basename(self.file_path)
    #  end
    #rescue ActiveRecord::MissingAttributeError
    #end

    def set_mimetype
      #debugger
      if !self.file_path.nil?
        ext = File.extname(self.file_path).downcase
        self.mime_type = MimeType.instance.hash[ext]
      end
    rescue ActiveRecord::MissingAttributeError
    end

    def set_encoded_file
      if !self.file_path.nil?
        path = Rails.root.join('public/assets/uploads', self.file_path)

        logger.info "file to encode #{path}"

        if File.exist?(path)
          self.encoded_file = Base64.encode64(File.open(path).read)
          logger.info "file encoded"
        end
      end
    end

    # Remove the file
    def remove_file
      if !self.file_path.nil?
        paths = [Rails.root.join('public/assets/uploads', self.file_path),
          Rails.root.join('public/assets/images', self.project.uuid.downcase.parameterize("_"), self.file_path)]
        
        paths.each { |path| File.delete(path) if File.exist?(path) }
      end
    rescue ActiveRecord::MissingAttributeError
    end

    #def move_file
    #  if !self.file_path.nil?
    #    source = Rails.root.join('public/assets/uploads', self.file_path)
    #    dest = Rails.root.join('public/assets/images', self.project.uuid.downcase.parameterize("_"), self.file_path)
        #debugger
    #    FileUtils.mkdir_p(Rails.root.join('public/assets/images', self.project.uuid.downcase.parameterize("_")))
    #    FileUtils.mv(source, dest, :force => true) if File.exist?(source)
    #  end
    #rescue ActiveRecord::MissingAttributeError
    #end
end
