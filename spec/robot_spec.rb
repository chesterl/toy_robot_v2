require 'spec_helper'

describe Robot do

  context "valid hash args are passed" do

    let!(:robot) { Robot.new }

    before :each do
      robot.direction = Direction.new('north')
      robot.position = TablePosition.new(1,1)
      @table = Table.new
    end

    it "should move robot" do
      robot.move(@table)
      expect(robot.position.y).to eq 2
    end

    it "should turn left" do
      robot.left
      output = capture_standard_output { robot.report }
      expect(output).to eql("1,1,WEST")
    end

    it "should turn right" do
      robot.right
      output = capture_standard_output { robot.report }
      expect(output).to eql("1,1,EAST")
    end

    it "should place the robot" do
      direction = Direction.new('north')
      position = TablePosition.new(1,1)
      robot.place(position,direction)
      expect(robot.position.x).to eq 1
    end

    it "should report the current position and direction" do
      output = capture_standard_output { robot.report }
      expect(output).to eql("1,1,NORTH")
    end

  end

end