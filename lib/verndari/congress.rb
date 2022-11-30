require 'faraday'

module Verndari
  class Congress

    def initialize(app)
      @app = app
    end

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
          return [401, {"Content-Type" => "application/json"},
            [{
               description: "Unauthorized Access",
               error: {
                 code: 401,
                 message: "Your application license key is invalid or expired."
               }
             }.to_json]
          ]
        end
      rescue
        return [status, headers, response]
      end


    end
  end
end
