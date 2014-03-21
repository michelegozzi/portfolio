require 'test_helper'

class SectorTest < ActiveSupport::TestCase
  test "should not create a sector with empty description" do
    
    s = Sector.new

    assert !s.save

  end

  test "should not create a sector with a too long description" do
    
    s = Sector.new
    s.description = Faker::Lorem.characters(51)
    assert !s.save

  end

  test "should create a sector with just a description" do
    
    s = Sector.new
    s.description = Faker::Commerce.department
    assert s.save

  end

  test "should create a sector with all fields" do
    
    s = Sector.new
    s.description = Faker::Commerce.department

    icon = IconSector::ICONS[1]

    if !icon.nil?
      s.icon_name = icon[0]
      s.icon_class = icon[1]
    end

    assert s.save

  end
end
