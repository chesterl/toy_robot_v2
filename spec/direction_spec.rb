require 'spec_helper'

describe Direction do

  let(:direction) { Direction.new('north') }

  it "turn_left should move the last array direction to the front" do
    direction.turn_left
    expect(direction.directions).to eq ['west','north','east','south']
  end

  it "turn_right should move the first array direction to the back" do
    direction.turn_right
    expect(direction.directions).to eq ['east','south','west','north']
  end

end