# frozen_string_literal: true
require 'rails'
require_relative "verndari/version"
require_relative "verndari/configuration"
require "verndari/railtie" if defined?(Rails)

module Verndari
  class Error < StandardError; end

  class << self
    attr_accessor :configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.reset
    @configuration = Configuration.new
  end

  def self.configure
    yield(configuration)
  end
end
