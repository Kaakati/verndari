require 'faraday'

module Verndari
  class Congress

    def initialize(app)
      @app = app
    end

    # Verndari.configure do |config|
    #   config.host = "sirdab.co"
    #   config.email = 'notifications@sirdab.co'
    # end


    def call(env)
      base_url = 'https://verndari.io'
      email = Verndari.configuration.email
      host = Verndari.configuration.host

      begin
        request = Rack::Request.new(env)

        res = Faraday.post "#{base_url}/api/keys/validate", { email: email, domain: host, data: request.params.to_json }
        json_body = JSON.parse(res.body)

        if json_body['is_valid'].eql?(true)
          status, headers, response = @app.call(env)
          return [status, headers, response]
        else
          return [ 500, {}, ["Internal Server Error\n"]]
        end
      rescue
        return [status, headers, response]
      end


    end
  end
end
