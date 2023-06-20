require "./nameable.rb"

class Decorator < Nameable
    attr_accessor :nameable
    def initialize(nameable)
        @nameable = nameable
    end
end
