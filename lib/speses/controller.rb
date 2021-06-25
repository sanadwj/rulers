require 'erubis'
require "speses/file_model"

module Speses
  class Controller
    include Speses::Model
    def initialize(env)
      @env = env
    end

    def env
      @env
    end

    def controller_name
      klass = self.class
      klass = klass.to_s.gsub(/Controller$/,"")
      Speses.to_underscore(klass)
    end

    def render(view_name, locals = {})
      filename = File.join "app", "views",controller_name, "#{view_name}.html.erb"
      template = File.read(filename)
      eruby = Erubis::Eruby.new(template)
      eruby.result locals.merge(:env => env, :controller_name => controller_name)
    end
  end

end

