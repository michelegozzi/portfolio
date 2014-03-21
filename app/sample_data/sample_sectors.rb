# This module provides the feutures for sample data generation
module SampleSectors
  # Creates 3 sample sectors
  def self.create

    r = Random.new(1234)

    (1..3).each do |i|
      s = Sector.new
      s.description = Faker::Commerce.department

      icon = IconSector::ICONS[(r.rand(1..IconSector::ICONS.count))]

      if !icon.nil?
        s.icon_name = icon[0]
        s.icon_class = icon[1]
      end
      s.save!
    end
  end

  def self.init

    r = Random.new(1234)

    a = []

    (1..3).each do |i|
      s = Sector.new
      s.description = Faker::Commerce.department

      icon = IconSector::ICONS[(r.rand(1..IconSector::ICONS.count))]

      if !icon.nil?
        s.icon_name = icon[0]
        s.icon_class = icon[1]
      end
      #yield s
      a.push s
    end

    return a
  end
end