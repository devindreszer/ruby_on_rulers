# rulers/lib/rulers.rb
require "rulers/version"
require "rulers/routing"

module Rulers
  class Application
    def call(env)
      if env['PATH_INFO'] == '/favicon.ico'
        return [404, {'Content-Type' => 'text/html'}, []]
      end

      env['PATH_INFO'] = "/home/index" if env['PATH_INFO'] == "/"

      klass, act = get_controller_and_action(env) #klass (class) >> PeopleController; act (action) >> create
      controller = klass.new(env)
      begin
        text = controller.send(act)
      rescue
        return [500, {'Content-Type' => 'text/html'}, ["Internal Error"]]
      end

      [200, {'Content-Type' => 'text/html'}, [text]]
    end
  end

  class Controller
    def initialize(env)
      @env = env
    end

    def env
      @env
    end
  end
end
