require 'spec_helper'
require 'pry'

describe Simulation do

  context 'invalid commands' do

    let!(:simulation) { Simulation.new }

    context "not yet placed" do

      it "should not process an invalid command" do
        simulation.process('TEST')
        expect(simulation).not_to receive(:test)
      end

      it "should not process an invalid place command" do
        simulation.process('PLACE 3.3 EAST')
        output = capture_standard_output { simulation.process('REPORT') }
        expect(output).to be_empty
      end

      it "should ignore the place command if not valid x coordinates" do
        simulation.process('PLACE 6,5,EAST')
        output = capture_standard_output { simulation.process('REPORT') }
        expect(output).to be_empty
      end

      it "should ignore the place command if not valid y coordinates" do
        simulation.process('PLACE 5,6,EAST')
        output = capture_standard_output { simulation.process('REPORT') }
        expect(output).to be_empty
      end

      it "should ignore the place command if negative x coordinates" do
        simulation.process('PLACE -1,0,EAST')
        output = capture_standard_output { simulation.process('REPORT') }
        expect(output).to be_empty
      end

      it "should ignore the place command if negative y coordinates" do
        simulation.process('PLACE 0,-1,EAST')
        output = capture_standard_output { simulation.process('REPORT') }
        expect(output).to be_empty
      end

      it "should ignore the place command if not valid directions" do
        simulation.process('PLACE 5,5,EASTWEST')
        output = capture_standard_output { simulation.process('REPORT') }
        expect(output).to be_empty
      end

      it "should ignore the move command" do
        simulation.process('MOVE')
        output = capture_standard_output { simulation.process('REPORT') }
        expect(output).to be_empty
      end

      it "should ignore the left command" do
        simulation.process('LEFT')
        output = capture_standard_output { simulation.process('REPORT') }
        expect(output).to be_empty

      end

      it "should ignore the right command" do
        simulation.process('RIGHT')
        output = capture_standard_output { simulation.process('REPORT') }
        expect(output).to be_empty
      end

      it "should ignore the report command" do
        output = capture_standard_output { simulation.process('REPORT') }
        expect(output).to be_empty
      end
    end

    context "after initial placement" do

      before :each do
        simulation.process('PLACE 1,1,NORTH')
      end

      it "should ignore an invalid place command" do
        simulation.process('PLACE 360')
        output = capture_standard_output { simulation.process('REPORT') }
        expect(output).to eq('1,1,NORTH')
      end

      it "should ignore a place with negative x position" do
        simulation.process('PLACE -1,0,NORTH')
        output = capture_standard_output { simulation.process('REPORT') }
        expect(output).to eq('1,1,NORTH')
      end

      it "should ignore a place with negative y position" do
        simulation.process('PLACE 0,-1,NORTH')
        output = capture_standard_output { simulation.process('REPORT') }
        expect(output).to eq('1,1,NORTH')
      end

      it "should ignore a place with invalid positive x position" do
        simulation.process('PLACE 6,4,SOUTH')
        output = capture_standard_output { simulation.process('REPORT') }
        expect(output).to eq('1,1,NORTH')
      end

      it "should ignore a place with invalid positive y position" do
        simulation.process('PLACE 4,6,SOUTH')
        output = capture_standard_output { simulation.process('REPORT') }
        expect(output).to eq('1,1,NORTH')
      end

      it "should ignore an invalid move command" do
        simulation.process('MOVE 6,5,EAST')
        output = capture_standard_output { simulation.process('REPORT') }
        expect(output).to eq('1,1,NORTH')
      end

      it "should ignore an invalid report command" do
        simulation.process('REPORT 6,5,EAST')
        output = capture_standard_output { simulation.process('REPORT') }
        expect(output).to eq('1,1,NORTH')
      end

      it "should ignore a move command if robot moves to invalid position" do
        simulation.process('PLACE 5,5,NORTH')
        simulation.process('MOVE')
        output = capture_standard_output { simulation.process('REPORT') }
        expect(output).to eq('5,5,NORTH')
      end

      it "should ignore a place command if robot moves to invalid position" do
        simulation.process('PLACE 6,6,SOUTH')
        output = capture_standard_output { simulation.process('REPORT') }
        expect(output).to eq('1,1,NORTH')
      end

    end
  end

  context "valid commands" do

  let!(:simulation) { Simulation.new }

    it "should report the intial position and direction of robot" do
      simulation.process('PLACE 3,3,EAST')
      output = capture_standard_output { simulation.process('REPORT') }
      expect(output).to eq '3,3,EAST'
    end

    it "should place the robot if valid PLACE command" do
      simulation.process('PLACE 1,1,NORTH')
      output = capture_standard_output { simulation.process('REPORT') }
      expect(output).to eq '1,1,NORTH'
    end

    context "after initial placement" do

      before :each do
        simulation.process('PLACE 1,1,NORTH')
      end

      it "should report the position and direction after second place command" do
        simulation.process('PLACE 3,3,EAST')
        output = capture_standard_output { simulation.process('REPORT') }
        expect(output).to eq '3,3,EAST'
      end

      it "should report the position and direction after move command" do
        simulation.process('MOVE')
        output = capture_standard_output { simulation.process('REPORT') }
        expect(output).to eq '1,2,NORTH'
      end

      it "should report the position and direction after left command" do
        simulation.process('LEFT')
        output = capture_standard_output { simulation.process('REPORT') }
        expect(output).to eq '1,1,WEST'
      end

      it "should report the position and direction after right command" do
        simulation.process('RIGHT')
        output = capture_standard_output { simulation.process('REPORT') }
        expect(output).to eq '1,1,EAST'
      end

      it "should ignore an invalid command" do
        simulation.process('MOVE 3,3,EAST')
        output = capture_standard_output { simulation.process('REPORT') }
        expect(output).to eq('1,1,NORTH')
      end

      it "should ignore an invalid report command" do
        output = capture_standard_output { simulation.process('REPORT 3,3') }
        expect(output).to be_empty
      end
    end

    context "should not move off table" do
      it "when commanded 'MOVE' at highest y coordinate boundary" do
        simulation.process('PLACE 1,5,NORTH')
        simulation.process('MOVE')
        output = capture_standard_output { simulation.process('REPORT') }
        expect(output).to eql("1,5,NORTH")
      end

      it "when commanded 'MOVE' at lowest y coordinate boundary" do
        simulation.process('PLACE 1,0,SOUTH')
        simulation.process('MOVE')
        output = capture_standard_output { simulation.process('REPORT') }
        expect(output).to eql("1,0,SOUTH")
      end

      it "when commanded 'MOVE' at highest x coordinate boundary" do
        simulation.process('PLACE 5,1,EAST')
        simulation.process('MOVE')
        output = capture_standard_output { simulation.process('REPORT') }
        expect(output).to eql("5,1,EAST")
      end

      it "when commanded 'MOVE' at lowest x coordinate boundary" do
        simulation.process('PLACE 0,1,WEST')
        simulation.process('MOVE')
        output = capture_standard_output { simulation.process('REPORT') }
        expect(output).to eql("0,1,WEST")
      end
    end

  end
end