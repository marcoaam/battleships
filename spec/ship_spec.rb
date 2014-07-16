require 'ship'

describe Ship do

	let(:ship) { Ship.new }

  context 'when created' do
    it 'should have not taken any hits' do
        expect(ship.number_of_hits).to eq 0
    end

    it 'should not be sunken when created' do
    	ship = Ship.new
    	expect(ship).not_to be_sunk
    end

    it 'can be attacked' do
        ship = Ship.new
        expect(ship).to receive(:take_a_hit)
    	expect(ship.attack!).to be_an_instance_of Hit
    end

    it 'can receive several attacks' do
    	2.times{ship.attack!}
    	expect(ship.number_of_hits).to eq 2
    end

    it 'should be sunk when the number of hits is equal to its length' do
    	ship = Ship.new(length: 3)
    	(ship.length).times {ship.take_a_hit}
    	expect(ship).to be_sunk
    end

    it 'can create a carrier type of ship with a length of 5' do
    	carrier = Ship.carrier
    	expect(carrier.length).to eq 5
    end

    it 'can create a battleship type of ship with a length of 4' do
    	battleship = Ship.battleship
    	expect(battleship.length).to eq 4
    end

    it 'can create a submarine type of ship with a length of 3' do
    	submarine = Ship.submarine
    	expect(submarine.length).to eq 3
    end

    it 'can create a patrol type of ship with a length of 2' do
    	patrol_boat = Ship.patrol
    	expect(patrol_boat.length).to eq 2
    end
  end
end