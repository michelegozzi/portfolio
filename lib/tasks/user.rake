require 'rexml/document'
require 'optparse'
include REXML

namespace :user do |args|

  desc "Testing environment and variables"
  task :check => :environment  do
    
    options = {}
    OptionParser.new(args) do |opts|
      opts.banner = "Usage: rake user:check [options]"
      opts.on("-u", "--usr {username}","User's email address", String) do |usr|
        options[:usr] = usr
      end
      opts.on("-p", "--pwd {password}","User's password", String) do |pwd|
        options[:pwd] = pwd
      end
    end.parse!

    puts "test ..."

    puts "Check: #{options[:usr]} #{options[:pwd]}"

    puts "test executed."

    exit(0)
  end

  desc "Create user"
  # rake user:create -- -n admin -u ***REMOVED***@gmail.com -p password
  task :create => :environment  do
    
    options = {}
    OptionParser.new(args) do |opts|
      opts.banner = "Usage: rake user:create [options]"
      opts.on("-n", "--name {name}","User's name", String) do |name|
        options[:name] = name
      end
      opts.on("-u", "--usr {username}","User's email address", String) do |usr|
        options[:usr] = usr
      end
      opts.on("-p", "--pwd {password}","User's password", String) do |pwd|
        options[:pwd] = pwd
      end
    end.parse!

    puts "creating user account..."

    user = User.find_by_email(options[:usr])
    if user
      puts "the account already exists."
      exit(1)
    else

      user = User.new
      user.name = options[:name]
      user.email = options[:usr]
      user.password = options[:pwd]
      user.password_confirmation = options[:pwd]
      user.save!

      #User.create!(name: "xxx", email: "yyy", password: "zzz", password_confirmation: "zzz")

      puts "account created."
      exit(0)
    end
  end

  desc "Create user"
  # rake user:create2 name=admin usr=email pwd=password
  task :create2 => :environment  do
    
    usage = "USAGE: rake user:create2 name=admin usr=email pwd=password"

    name = ENV['name']
    usr = ENV['usr']
    pwd = ENV['pwd']

    if usr.nil?
      puts "usr is null."
      puts usage
      exit(1)
    end

    if name.nil?
      puts "name is null."
      puts usage
      exit(1)
    end

    if pwd.nil?
      puts "pwd is null."
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
  
end
