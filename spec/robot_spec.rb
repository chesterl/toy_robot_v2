require 'spec_helper'

describe Robot do

  context "no args are passed" do

    let!(:robot) { Robot.new }

    before :each do
      robot.facing = Direction.new('north')
      robot.position = TablePosition.new(1,1)
    end

    it "should move robot" do
      robot.move(nil)
      expect(robot.position.y).to eq 2
    end

    it "should turn left" do
      robot.left(nil)
      output = capture_standard_output { robot.report(nil) }
      expect(output).to eql("1,1,WEST")
    end

    it "should turn right" do
      robot.right('stuff')
      output = capture_standard_output { robot.report(nil) }
      expect(output).to eql("1,1,NORTH")
    end
  end

  context "args are passed" do

    let!(:robot) { Robot.new }

    before :each do
      robot.facing = Direction.new('north')
      robot.position = TablePosition.new(1,1)
    end

    it "should place the robot if valid place positions and directions" do
      robot.place(["1","1","north"])
      expect(robot.position.x).to eq 1
    end

    it "should not place the robot with invalid directions" do
      robot.place(["1","1","east"])
      robot.place(["1","1","moon"])
      expect(robot.facing.directions[0]).to eq 'east'
    end

    it "should report the current position and direction" do
      # robot.facing = Direction.new('north')
      # robot.position = TablePosition.new(1,1)
      output = capture_standard_output { robot.report(nil) }
      expect(output).to eql("1,1,NORTH")
    end

    it "should not move robot" do
      # robot.facing = Direction.new('north')
      # robot.position = TablePosition.new(1,1)
      robot.move('3,3')
      expect(robot.position.y).to eq 1
    end

    it "should not report" do
      # robot.facing = Direction.new('north')
      # robot.position = TablePosition.new(1,1)
      output = capture_standard_output { robot.report("1,1") }
      expect(output).to eql("")
    end

    it "should not turn left" do
      # robot.facing = Direction.new('north')
      # robot.position = TablePosition.new(1,1)
      robot.left('stuff')
      output = capture_standard_output { robot.report(nil) }
      expect(output).to eql("1,1,NORTH")
    end

  end
end