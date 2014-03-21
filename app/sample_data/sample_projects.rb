# This module provides the feutures for sample data generation
module SampleProjects

  # For each sector, creates some sample projects (between 10 and 40). For each project, creates some sample resources (between 0 and 10)
  def self.create
    Sector.all.each do |s|
      
      if s.nil?
        s = Sector.new
        s.description = Faker::Commerce.department
        s.save!
      end

      prng = Random.new(1234)

      (1..prng.rand(10..40)).each do |i|

        p = create_project(s) 
        p.save!
      end
    end
  end

  def self.create_project(s)

      p = s.projects.new
      p.name = "#{Faker::Commerce.product_name} #{j.to_s.rjust(2, '0')}"
      p.description = Faker::Lorem.sentence(15)
      p.url = Faker::Internet.url

      rname = p.name

      (1..prng.rand(0..10)).each do |j|
        r = p.resources.new
        r.file_path = "#{Faker::Internet.url}/images/img_#{j.to_s.rjust(2, '0')}.png"
        r.display_name = "#{rname} #{j.to_s.rjust(2, '0')}"
        r.mime_type = 'image/png'
      end
      return p
  end
end