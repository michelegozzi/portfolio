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
end

def add_data
  xmlfile = File.new(Rails.root.join('public', 'uploads', 'data.xml'))
  xmldoc = Document.new(xmlfile)
  xmldoc.elements.each("projects/project") do |e|
#    debugger
    

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