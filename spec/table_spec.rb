require 'spec_helper'

describe Table do

  let(:table) { Table.new }

  context "valid position" do
    it "with x coord table edge" do
      position = table.valid_position?(5,2)
      expect(position).to be true
    end

    it "with y coord table edge" do
      position = table.valid_position?(3,5)
      expect(position).to be true
    end

    it "with x + ycoord table edge" do
      position = table.valid_position?(0,0)
      expect(position).to be true
    end
  end

  context "invalid position" do
    it "with a negative x position" do
      position = table.valid_position?(-1,0)
      expect(position).to be false
    end

    it "with a negative y position" do
      position = table.valid_position?(0,-1)
      expect(position).to be false
    end

    it "with an invalid positive x position" do
      position = table.valid_position?(6,4)
      expect(position).to be false
    end

    it "with an invalid positive y position" do
      position = table.valid_position?(4,6)
      expect(position).to be false
    end
  end

end