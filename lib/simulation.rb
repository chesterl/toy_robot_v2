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
      command_hash = { placement: @coord, direction: direction, table: table }
      if valid_place_command
        robot.send(@com,command_hash)
      elsif valid_other_command and robot.placed
        robot.send(@com,command_hash)
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
    # if command_array[1] is not nil, it can be a place command
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
      valid_pos and valid_dir and valid_length
    end
  end

  def valid_other_command
    @args.nil?
  end

end