# rulers/lib/rulers/routing.rb
module Rulers
  class Application
    def get_controller_and_action(env)
      _, cont, action, after = env["PATH_INFO"].split.('/', 4) # PATH_INFO = "/people/create/"
      cont = cont.capitalize # People
      cont += "Controller" # PeopleController

      [Object.const_get(cont), action] # const_get is a method that looks up any name that starts w/ a capital letter
    end
  end
end
