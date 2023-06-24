require_relative './app'

class Interface
    def initialize
        @app = App.new(self)

        puts
        puts 'Welcome to School Library System!'
        # here should deply the main menu
    end

    
