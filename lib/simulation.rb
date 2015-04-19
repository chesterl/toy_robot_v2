class Simulation

  def initialize
    @table = Table.new(5,5)
    @robot = Robot.new
  end

  def process(command)
    begin
      read_command(command)
      # binding.pry
      # Pass on command if coordinates or valid or do not exist (e.g. another command)
      if @valid_pos || @valid_pos.nil?
        @robot.send(@com,@coord)
      else
        # ignore command
      end

    rescue StandardError
    end

  end

  private

  def read_command(command)
    command_array = command.downcase.split(' ')
    # split command into components
    @com = command_array[0].to_sym
    # reset @valid_pos
    @valid_pos = nil
    # if command_array[1] is not nil, it is a place command
    unless command_array[1].nil?
      @coord = command_array[1].split(',')
      @valid_pos = @table.valid_position?(@coord[0].to_i, @coord[1].to_i)
      # check if this factors in random command_array[1] commands
    end
  end



end