module Verndari
  class Configuration
    attr_writer :host, :email

    def initialize
      @host = nil
      @email = nil
      @base_url = 'http://0.0.0.0:3001/api'
    end

    def host
      # raise Errors::Configuration, "Verndari host key is missing!" unless @host
      @host
    end

    def email
      # raise Errors::Configuration, "Verndari email key is missing!" unless @email
      @email
    end

  end
end
