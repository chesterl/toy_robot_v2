require 'spec_helper'

describe TablePosition do

  context 'overriding method' do

    let!(:table_position) { TablePosition.new(3,3) }

    it "should read the x and y coordinates" do
      expect(table_position.to_s).to eq "3,3"
    end
  end

  context 'valid position' do
    let!(:table_position) { TablePosition.new(3,3) }
    let!(:table) { Table.new }

    it "north should increase y position by 1" do
      expect { table_position.north(table) }.to change{table_position.y}.by(1)
    end

    it "east should increase x position by 1" do
      expect { table_position.east(table) }.to change{table_position.x}.by(1)
    end

    it "south should decrease y position by 1" do
      expect { table_position.south(table) }.to change{table_position.y}.by(-1)
    end

    it "west should decrease x position by 1" do
      expect { table_position.west(table) }.to change{table_position.x}.by(-1)
    end


  end

  context 'invalid position' do

    let!(:table) { Table.new }

    it "north should not increase y position by 1" do
      table_position = TablePosition.new(0,5)
      expect { table_position.north(table) }.to_not change{table_position.y}
    end

    it "east should not increase x position by 1" do
      table_position = TablePosition.new(5,0)
      expect { table_position.east(table) }.to_not change{table_position.x}
    end

    it "south should not decrease y position by 1" do
      table_position = TablePosition.new(5,0)
      expect { table_position.south(table) }.to_not change{table_position.y}
    end

    it "west should not decrease x position by 1" do
      table_position = TablePosition.new(0,5)
      expect { table_position.west(table) }.to_not change{table_position.x}
    end
  end

end