require 'erubis'

module Speses
  class Controller
    def initialize(env)
      @env = env
    end

    def env
      @env
    end

    def controller_nam
      klass = self.class
      klass = klass.to_s.gsub(/Controller$/,"")
      Speses.to_underscore(klass)
    end

    def render(view_name, locals = {})
      filename = File.join "app", "views",controller_nam, "#{view_name}.html.erb"
      template = File.read(filename)
      eruby = Erubis::Eruby.new(template)
      eruby.result locals.merge(:env => env, :controller_nam => controller_nam)
    end
  end

end

