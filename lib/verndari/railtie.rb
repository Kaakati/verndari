require_relative 'congress'

module Verndari
  class Railtie < ::Rails::Railtie
    config.before_configuration do
      Rails.application.config.middleware.use Verndari::Congress
    end
  end
end
