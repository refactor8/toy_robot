module ToyRobot
  class Robot
    attr_reader :position
    
    def initialize(position = 0)
      @position = position
    end

    def move
      @position += 1
    end
  end
end
