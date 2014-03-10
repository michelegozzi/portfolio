require 'rexml/document'
require 'optparse'
include REXML

namespace :user do |args|

  desc "Create user"
  # rake user:create name=admin usr=email pwd=password
  task :create => :environment  do
    
    usage = "USAGE: rake user:create name=admin usr=email pwd=password"

    name = ENV['name']
    usr = ENV['usr']
    pwd = ENV['pwd']

    if usr.nil?
      puts "ERROR: usr is null."
      puts usage
      exit(1)
    end

    if name.nil?
      puts "ERROR: name is null."
      puts usage
      exit(1)
    end

    if pwd.nil?
      puts "ERROR: pwd is null."
      puts usage
      exit(1)
    end

    puts "creating user account..."

    user = User.find_by_email(usr)
    if user
      puts "the account already exists."
      exit(1)
    else

      user = User.new
      user.name = name
      user.email = usr
      user.password = pwd
      user.password_confirmation = pwd
      user.save!

      #User.create!(name: "xxx", email: "yyy", password: "zzz", password_confirmation: "zzz")

      puts "account created."
      exit(0)
    end

  end

  desc "Change user's password"
  task :chpwd => :environment  do

    begin
  
    
      usage = "USAGE: rake user:chpwd usr=email pwd=newpassword"
      
      usr = ENV['usr']
      pwd = ENV['pwd']

      if usr.nil?
        puts "ERROR: usr is null."
        puts usage
        exit(1)
      end

      if pwd.nil?
        puts "ERROR: pwd is null."
        puts usage
        exit(1)
      end

      #raise "something's wrong here"

      puts "changing user's password..."

      user = User.find_by_email(usr)
      if user

        user.password = pwd
        user.password_confirmation = pwd
        user.save!

        puts "password changed."
        exit(0)
      else

        puts "account not found."
        exit(1)
      end
    
    rescue
      
      raise "error executing task"
    end

  end

  desc "Lists all users"
  task :list => :environment  do

    begin
      puts "USERS:"

      @users = User.all

      @users.each do |u|
        put u.name
        put u.email
        #put "* #{u.name} [email = #{u.email}]"
      end

    rescue
      raise "error executing task"
    end
  end
  
end
