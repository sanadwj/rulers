# frozen_string_literal: true

require_relative "rulers/version"

module Rulers
  class Application
    def call(env)
      [200, {'Content-type' => 'text/html'}, ["hello from ruby on rulers"]]
    end
  end
end
