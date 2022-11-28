# frozen_string_literal: true

require_relative "verndari/version"
require_relative "verndari/configuration"

module Verndari
  extend Config
  class Error < StandardError; end
end
