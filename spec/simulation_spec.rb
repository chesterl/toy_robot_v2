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

      it "should not process an invalid command" do
        simulation.process('PLACE 3,3, EAST')
        output = capture_standard_output { simulation.process('REPORT') }
        expect(output).to be_empty
      end

      it "should ignore the place command if not valid table coordinates" do
        simulation.process('PLACE 6,5,EAST')
        output = capture_standard_output { simulation.process('REPORT') }
        expect(output).to be_empty
      end

      it "should ignore the place command if not valid table coordinates" do
        simulation.process('PLACE -1,-1,EAST')
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
        simulation.process('PLACE 6,5,EAST')
        output = capture_standard_output { simulation.process('REPORT') }
        expect(output).to eq('1,1,NORTH')
      end

      it "should ignore an invalid move command" do
        simulation.process('PLACE 5,5,NORTH')
        simulation.process('MOVE')
        output = capture_standard_output { simulation.process('REPORT') }
        expect(output).to eq('5,5,NORTH')
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

    end

  end

end