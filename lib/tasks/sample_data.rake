require 'rexml/document'
include REXML

namespace :db do

  desc "Fill database with sample data"
  task populate: :environment do
    Sector.destroy_all
    add_data
  end
  task dropdata: :environment do
    Sector.destroy_all
  end
  task populatedata: :environment do
    add_data
  end
  task populateprojects: :environment do
    add_projects
  end
  task fixrespaths: :environment do
    fix_resources_file_paths
  end

  task fixresfiles: :environment do
    fix_resource_files
  end
end

def add_data
  xmlfile = File.new(Rails.root.join('public', 'uploads', 'data.xml'))
  xmldoc = Document.new(xmlfile)
  xmldoc.elements.each("projects/project") do |e|
    sectordesc = nil
    e.elements.each("sector_description") { |i| sectordesc = i.text.to_s }
    if (!sectordesc.nil?)
      sector = Sector.find_by_description(sectordesc)
      if sector.nil?
        sector = Sector.new
        sector.description = sectordesc
        sector.save!
      end
      project = sector.projects.new
      e.elements.each("display_name") { |i| project.name = i.text.to_s }
      e.elements.each("description") { |i| project.description = i.text.to_s }
      e.elements.each("url") { |i| project.url = i.text.to_s }
      e.elements.each("resources/resource") do |r|
        resource = project.resources.new
        r.elements.each("description") { |ri| resource.description = ri.text.to_s }
        r.elements.each("url") { |ri| resource.url = ri.text.to_s }
        r.elements.each("mime") { |ri| resource.mime = ri.text.to_s }
      end
      project.save!
    end
  end
end

def add_projects
  
  Sector.all.each do |s|
    
    if s.nil?
      s = Sector.new
      s.description = Faker::Commerce.department
      s.save!
    end

    prng = Random.new(1234)

    (1..prng.rand(10..40)).each do |i|
      p = s.projects.new
      p.name = "#{Faker::Commerce.product_name} #{j.to_s.rjust(2, '0')}"
      p.description = Faker::Lorem.sentence(15)
      p.url = Faker::Internet.url

      rname = p.name

      (1..prng.rand(1..10)).each do |j|
        r = p.resources.new
        r.file_path = "#{Faker::Internet.url}/images/img_#{j.to_s.rjust(2, '0')}.png"
        r.display_name = "#{rname} #{j.to_s.rjust(2, '0')}"
        r.mime_type = 'image/png'
      end
      p.save!
    end
  end
end

# Fix for all the resources the :file_path value
def fix_resources_file_paths
  Project.all.each do |p|
    if p.uuid.nil?
      p.create_uuid
      p.save!
    end

    p.resources.each do |r|
      if !r.file_path.nil?
        source = Rails.root.join('app/assets/images', r.file_path)
        dest = Rails.root.join('public/assets/images', r.project.uuid.downcase.parameterize("_"), r.file_path)
        #debugger
        FileUtils.mkdir_p(Rails.root.join('public/assets/images', r.project.uuid.downcase.parameterize("_")))
        FileUtils.mv(source, dest, :force => true) if File.exist?(source)
        r.file_path = File.basename(r.file_path)
        r.save!
      end

    end
  end
  
end

def fix_resource_files
  Resource.all.each do |r|
    if !r.file_path.nil?
      path = Rails.root.join('public/assets/images', r.project.uuid.downcase.parameterize("_"), r.file_path)

      if File.exist?(path)
        r.encoded_file = Base64.encode64(File.open(path).read)
        r.save!
      end
    end
  end

end