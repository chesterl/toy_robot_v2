require 'spec_helper'

describe Robot do

  context "valid hash args are passed" do

    let!(:robot) { Robot.new }

    before :each do
      robot.facing = Direction.new('north')
      robot.position = TablePosition.new(1,1)
      @hash = { placement: nil, direction: 'north', table: Table.new }
    end

    it "should move robot" do
      robot.move(@hash)
      expect(robot.position.y).to eq 2
    end

    it "should turn left" do
      robot.left(@hash)
      output = capture_standard_output { robot.report(@hash) }
      expect(output).to eql("1,1,WEST")
    end

    it "should turn right" do
      robot.right(@hash)
      output = capture_standard_output { robot.report(@hash) }
      expect(output).to eql("1,1,EAST")
    end

    it "should place the robot" do
      hash = { placement: ["1","1","north"], direction: 'north', table: Table.new }
      robot.place(hash)
      expect(robot.position.x).to eq 1
    end

    it "should report the current position and direction" do
      output = capture_standard_output { robot.report(@hash) }
      expect(output).to eql("1,1,NORTH")
    end

  end

  context "invalid hash args are passed" do

    let!(:robot) { Robot.new }

    before :each do
      robot.facing = Direction.new('north')
      robot.position = TablePosition.new(1,1)
    end

    it "should not place the robot with invalid directions" do
      hash = { placement: ["1","1","east"], direction: 'east', table: Table.new }
      robot.place(hash)
      hash = { placement: ["1","1","moon"], direction: 'moon', table: Table.new }
      robot.place(hash)
      expect(robot.facing.directions[0]).to eq 'east'
    end

    it "should not move robot with invalid move" do
      hash = { placement: ["3,3"], direction: nil, table: Table.new }
      robot.move(hash)
      expect(robot.position.y).to eq 1
    end

    it "should not report with invalid report" do
      hash = { placement: ["3,3"], direction: nil, table: Table.new }
      output = capture_standard_output { robot.report(hash) }
      expect(output).to eql("")
    end

    it "should not turn left with invalid left" do
      hash = { placement: ["stuff"], direction: nil, table: Table.new }
      robot.left(hash)
      hash = { placement: nil, direction: nil, table: Table.new }
      output = capture_standard_output { robot.report(hash) }
      expect(output).to eql("1,1,NORTH")
    end

    it "should not turn right with invalid right" do
      hash = { placement: ["stuff"], direction: nil, table: Table.new }
      robot.right(hash)
      hash = { placement: nil, direction: nil, table: Table.new }
      output = capture_standard_output { robot.report(hash) }
      expect(output).to eql("1,1,NORTH")
    end

  end
end