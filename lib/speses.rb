# frozen_string_literal: true
require_relative "speses/version"
require "speses/routing"
require "speses/util"
require "speses/dependencies"
require "speses/controller"
require "speses/file_model"

module Speses
  class Application
    def call(env)
      if env['PATH_INFO'] == '/favicon.ico'
        return [404, {'Content-Type' => 'text/html'}, []]
      elsif env['PATH_INFO'] == '/'
        return [200, {'Content-Type' => 'text/html'}, ['quotes/a_quote']]
      end

      klass, act = get_controller_and_action(env)
      controller = klass.new(env)
      text = controller.send(act)
      [200, {'Content-type' => 'text/html'}, [text]]
    end
  end

 end


