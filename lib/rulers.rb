# frozen_string_literal: true
require 'rulers/array'
require_relative "rulers/version"

module Rulers
  class Application
    def call(env)
      `echo debug > debug.txt`
      [200, {'Content-type' => 'text/html'}, ["hello from ruby on rulers"]]
    end
  end
end
