require 'ship'

describe Ship do

	let(:ship) { Ship.new }

  it 'is not sunk when created' do
  	ship = Ship.new
  	expect(ship).not_to be_sunk
  end

  it 'can take hits' do
  	expect(ship.hit).to eq 1
  end

  it 'can several hits' do
  	ship.hit
  	expect(ship.hit).to eq 2
  end

  it 'have 0 number of hits when created' do
  	expect(ship.number_of_hits).to eq 0
  end

  it 'can be created with a certain amount of hits limit' do
  	ship = Ship.new(length: 3)
  	expect(ship.length).to eq 3
  end

  it 'can be sunk when number of hits equals length' do
  	ship = Ship.new(length: 3)
  	(ship.length).times {ship.hit}
  	expect(ship).to be_sunk
  end

  it 'can create a 5 length size carrier' do
  	carrier = Ship.carrier
  	expect(carrier.length).to eq 5
  end

  it 'can create a 4 length size battleship' do
  	battleship = Ship.battleship
  	expect(battleship.length).to eq 4
  end

  it 'can create a 3 length size submarine' do
  	submarine = Ship.submarine
  	expect(submarine.length).to eq 3
  end

  it 'can create a 2 length size patrol boat' do
  	patrol_boat = Ship.patrol
  	expect(patrol_boat.length).to eq 2
  end
  
end