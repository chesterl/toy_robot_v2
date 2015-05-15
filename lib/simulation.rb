class Simulation

  attr_reader :robot, :table, :direction

  def initialize
    @table = Table.new
    @robot = Robot.new
  end

  def process(command)
    begin
      read_command(command)
      # Pass on command if coordinates are valid or do not exist (e.g. another command)
      if @valid_pos || @valid_pos.nil?
        command_hash = { placement: @coord, direction: direction, table: table }
        robot.send(@com, command_hash)
      else
        # ignore command
      end

    rescue StandardError
    end

  end

  private

  def read_command(command)
    command_array = command.downcase.split(' ')
    @com = command_array[0].to_sym
    # reset variables on each read
    @valid_pos, @coord = nil
    # if command_array[1] is not nil, it is a place command
    unless command_array[1].nil?
      @coord = command_array[1].split(',')
      @valid_pos = table.valid_position?(@coord[0].to_i, @coord[1].to_i)
      @direction = @coord[2]
    end
  end

end