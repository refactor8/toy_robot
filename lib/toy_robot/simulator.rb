module ToyRobot
  class Simulator
    attr_reader :robot

    def initialize(table)
      @table = table
    end

    def place(east, north, facing)
      return unless @table.valid_location?(east, north)
      @robot = Robot.new(east, north, facing)
    end

    def move
      return unless robot_placed?
      return unless @table.valid_location?(*robot.next_move)
      robot.move
    end

    def turn_left
      return unless robot_placed?
      robot.turn_left
    end

    def turn_right
      return unless robot_placed?
      robot.turn_right
    end

    def report
      return unless robot_placed?
      position = robot.report
      puts "#{position[:east]},#{position[:north]},#{position[:direction]}"
    end

    def robot_placed?
      !robot.nil?
    end

    def invalid(command)
      puts "'#{command.strip}' is an invalid command"
    end
  end
end
