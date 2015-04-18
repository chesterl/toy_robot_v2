class Simulation

  def initialize
    @table = Table.new(5,5)
    @robot = Robot.new
  end

  def process(command)
    begin
      read_command(command)
      # if @robot.placed
      # binding.pry
        @robot.send(@com,@pos_dir)
      # else

      # end
      # if on table, then accept all
      # else only accept place commands

    rescue StandardError
    end

  end

  private

  def read_command(command)
    command_array = command.downcase.split(' ')
    @com = command_array[0].to_sym
    @pos_dir = command_array[1]
  end



end