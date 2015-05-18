class Simulation

  attr_reader :robot, :table, :direction

  def initialize
    @table = Table.new
    @robot = Robot.new
  end

  def process(command)
    begin
      read_command(command)
      # Pass on command if coordinates are valid w/ valid # of args or do not exist (e.g. another command)
      command_hash = { placement: @coord, table: table }

      if valid_place_command
        coordinates = TablePosition.new(@coord[0].to_i, @coord[1].to_i)
        facing = Direction.new(direction)
        robot.place(coordinates,facing)
      elsif move_command and empty_args
        robot.move(table) if robot.placed
      elsif empty_args
        robot.send(@com) if robot.placed
      else
        # ignore
      end

    rescue StandardError
    end

  end

  private

  def read_command(command)
    command_array = command.downcase.split(' ')
    @com = command_array[0].to_sym
    @args = command_array[1]
    # reset variables on each read
    @direction, @coord = nil
    # if args is not nil, it can be a place command
    unless @args.nil?
      @coord = command_array[1].split(',')
      @direction = @coord[2]
    end
  end

  def valid_place_command
    if @args.nil?
      false
    else
      valid_pos = table.valid_position?(@coord[0].to_i, @coord[1].to_i)
      valid_dir = Direction::DIRECTIONS.include?(@coord[2])
      valid_length = @coord.length == 3
      valid_pos and valid_dir and valid_length and @com == :place
    end
  end

  def move_command
    @com == :move
  end

  def empty_args
    @args.nil?
  end

end