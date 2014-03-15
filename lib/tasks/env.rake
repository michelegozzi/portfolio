namespace :env do |args|

  desc "Verify environment variables"
  # rake env:verify
  task :verify => :environment  do
    
    names = [
      'DROPBOX_APP_KEY',
      'DROPBOX_APP_SECRET',
      'PORTFOLIO_SMTP_USR',
      'PORTFOLIO_SMTP_PWD',
      'PORTFOLIO_SMTP_DOMAIN',
      'PORTFOLIO_SMTP_ADDRESS',
      'PORTFOLIO_SMTP_PORT',
      'PORTFOLIO_MAILER_DEFAULT_FROM',
      'GOOGLE_ANALYTICS_ID_4_PORTFOLIO',
      'GOOGLE_ANALYTICS_DOMAIN_4_PORTFOLIO'
    ]

    names.each do |n|
      puts "#{n} = #{ENV[n]}#{'is null!' if ENV[n].nil?}"
    end

    exit(0)

  end
end