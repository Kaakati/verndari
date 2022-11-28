# frozen_string_literal: true

require "verndari"

RSpec.configure do |config|
  config.before(:all) do
    Verndari.configure do |config|
      config.host = ENV['VERN_HOST']
      config.email = ENV['VERN_EMAIL']
    end
  end
end
