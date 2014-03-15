Portfolio
=========

== Deployment Heroku

See:
https://devcenter.heroku.com/articles/config-vars#setting-up-config-vars-for-a-deployed-application

Set the following environment variables on Heroku:

  $ heroku config:set DROPBOX_APP_KEY=<your_key>
  $ heroku config:set DROPBOX_APP_SECRET=<your_secret>
  $ heroku config:set PORTFOLIO_SMTP_USR=<your_username>
  $ heroku config:set PORTFOLIO_SMTP_PWD=<your_password>
  $ heroku config:set PORTFOLIO_SMTP_DOMAIN=<your_app_domain>
  $ heroku config:set PORTFOLIO_SMTP_ADDRESS=<your_smtp_address>
  $ heroku config:set PORTFOLIO_SMTP_PORT=<your_smtp_port>
  $ heroku config:set PORTFOLIO_MAILER_DEFAULT_FROM=noreply@yourmail.org
  $ heroku config:set GOOGLE_ANALYTICS_ID_4_PORTFOLIO=<your_app_id>
  $ heroku config:set GOOGLE_ANALYTICS_DOMAIN_4_PORTFOLIO=<your_app_domain>

Create one or more adminstrators:

  $ heroku run rake user:create name=<your_name> usr=<your_email> pwd=<your_password>

Or you can change the password of an existing user:

  $ heroku run rake user:chpwd usr=<your_email> pwd=<new_password>