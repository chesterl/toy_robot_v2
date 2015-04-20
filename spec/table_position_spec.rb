require 'spec_helper'

describe TablePosition do

  context 'valid position' do
    let!(:table) { TablePosition.new(3,3) }

    it "north should increase y position by 1" do
      expect { table.north }.to change{table.y}.by(1)
    end

    it "east should increase x position by 1" do
      expect { table.east }.to change{table.x}.by(1)
    end

    it "south should decrease y position by 1" do
      expect { table.south }.to change{table.y}.by(-1)
    end

    it "west should decrease x position by 1" do
      expect { table.west }.to change{table.x}.by(-1)
    end
  end

  context 'invalid position' do

    it "north should not increase y position by 1" do
      table = TablePosition.new(0,5)
      expect { table.north }.to_not change{table.y}
    end

    it "east should not increase x position by 1" do
      table = TablePosition.new(5,0)
      expect { table.east }.to_not change{table.x}
    end

    it "south should not decrease y position by 1" do
      table = TablePosition.new(5,0)
      expect { table.south }.to_not change{table.y}
    end

    it "west should not decrease x position by 1" do
      table = TablePosition.new(0,5)
      expect { table.west }.to_not change{table.x}
    end
  end

end