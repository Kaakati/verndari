module Verndari
  class Congress

    def initialize(app)
      @app = app
    end

    def call(env)
      license_date = DateTime.parse('10/10/2014')

      if license_date < DateTime.now
        return [
          401,
          {"Content-Type" => "application/json"},
          [{
             description: "Unauthorized Access",
             error: {
               code: 401,
               message: "Your Verndari application license key is invalid or expired."
             }
           }.to_json]
        ]
      end

    end
  end
end
