module ToyRobot
  class Robot
    DIRECTIONS = ["NORTH", "EAST", "SOUTH", "WEST"]
    attr_reader :east, :north, :direction

    def initialize(east = 0, north = 0, direction = "NORTH")
      @east = east
      @north = north
      @direction = direction
    end

    def turn_left
      turn(:left)
    end

    def turn_right
      turn(:right)
    end

    def move
      send("move_#{@direction.downcase}")
    end

    def move_east
      @east += 1
    end

    def move_west
      @east -= 1
    end

    def move_north
      @north += 1
    end

    def move_south
      @north -= 1
    end

    private

    def turn(turn_direction)
      index = DIRECTIONS.index(@direction)
      rotations = turn_direction == :right ? 1: -1
      @direction = DIRECTIONS.rotate(rotations)[index]
    end
  end
end
