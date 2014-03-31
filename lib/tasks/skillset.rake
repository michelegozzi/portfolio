require 'rexml/document'
require 'optparse'
include REXML

namespace :skillset do |args|

  desc "Create a new skillset"
  # rake skillset:create name=value
  task :create => :environment  do
    
    usage = "USAGE: rake skillset:create name=value"

    name = ENV['name']
    
    if name.nil?
      puts "ERROR: name is null."
      puts usage
      exit(1)
    end

    puts "creating skillset..."

    skillset = Skillset.find_by_name(name)
    if skillset
      puts "the skillset already exists."
      exit(1)
    else

      skillset = Skillset.new
      skillset.name = name
      skillset.save!

      puts "skillset created."
      exit(0)
    end

  end

  desc "Add skills to a skillset"
  # rake skillset:addskills name=value skills=comma_sep_values
  task :addskills => :environment  do
    
    usage = "USAGE: rake skillset:addskills name=value skills=comma_sep_values"

    name = ENV['name']
    skills = ENV['skills']
    
    if name.nil?
      puts "ERROR: name is null."
      puts usage
      exit(1)
    end

    if skills.nil?
      puts "ERROR: skills is null."
      puts usage
      exit(1)
    end

    puts "add skills to a skillset..."

    @skillset = Skillset.find_by_name(name)
    if @skillset.nil?
      @skillset = Skillset.new
      @skillset.name = name
      @skillset.save!     
    end

    skills.split(',').each do |s|
      s = s.strip
      if @skillset.skills.find_by_name(s).nil?
        @skill = @skillset.skills.new
        @skill.name = s
        @skill.save!
      end
    end

  end
 
end

