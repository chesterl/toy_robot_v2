require 'spec_helper'
require 'pry'

describe Simulation do

  context 'invalid commands' do

    let!(:simulation) { Simulation.new }

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
      simulation.process('PLACE 6,5,EAST')
      output = capture_standard_output { simulation.process('REPORT') }
      expect(output).to be_empty
    end

    it "should ignore the place command if not valid directions" do
      simulation.process('PLACE 5,5,EASTWEST')
      output = capture_standard_output { simulation.process('REPORT') }
      expect(output).to be_empty
    end

    it "should ignore the move command if not yet placed" do
      simulation.process('MOVE')
      output = capture_standard_output { simulation.process('REPORT') }
      expect(output).to be_empty
    end

    it "should ignore the left command if not yet placed" do
      simulation.process('LEFT')
      output = capture_standard_output { simulation.process('REPORT') }
      expect(output).to be_empty

    end

    it "should ignore the right command if not yet placed"

    it "should ignore the report command if not yet placed placed" do
      output = capture_standard_output { simulation.process('REPORT') }
      expect(output).to be_empty
    end
  end

  it "should report the position and direction of robot" do
    simulation.process('PLACE 3,3,EAST')
    output = capture_standard_output { simulation.process('REPORT') }
    expect(output).to eq '3,3,EAST'
  end

  it "should place the robot if valid PLACE command" do
    simulation.process('PLACE 1,1,NORTH')
    output = capture_standard_output { simulation.process('REPORT') }
    expect(output).to eq '1,1,NORTH'
  end



end