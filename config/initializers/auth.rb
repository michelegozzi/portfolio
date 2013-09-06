#AUTH_CONFIG = YAML.load_file("#{RAILS_ROOT}/config/auth.yml")[RAILS_ENV]


AUTH_CONFIG = YAML.load_file(Rails.root.join("config/auth.yml"))[Rails.env]


