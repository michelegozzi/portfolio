class AuthCfg
    attr_accessor :options

    @options = {}

    def initialize
        @options = YAML.load_file(Rails.root.join("config/auth2.yml"))
    end

    def save
      #File.open(Rails.root.join("config/auth2.yml"), 'w+') {|f| f.write(@options.to_yaml) }

      File.open(Rails.root.join("config/auth2.yml"), 'w' ) do |out|
        YAML.dump(@options, out)
      end

    end
end