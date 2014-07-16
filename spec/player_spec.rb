require 'player'

describe Player do

let (:player) {Player.new(name: "Michiel")}

	it 'has a name' do
		expect(player.name).to eq "Michiel"
	end

	it 'expect the player to have a board' do
		expect(player.board).to be_an_instance_of Board
	end

	it 'expect the player to start with 4 ships' do
		expect(player.ships.count).to eq 4
	end

	it 'expect the first ship to be an instance of the Ship class' do
		expect(player.ships.first).to be_an_instance_of Ship
	end

	it 'expect the first ship to be a carrier (i.e length = 5)' do
		expect(player.ships.first.length).to eq 5
	end

	it 'can shoot at each other' do 
		coordinate = "A2"
		marco_attacking = Player.new
		chloe_receiving = Player.new
		expect(chloe_receiving.board).to receive(:attacked_at).with(coordinate)
		marco_attacking.shoot_at(chloe_receiving,coordinate)
	end

	it 'passes the ship and coordinates to the board so the ship to be placed' do
		coordinate = "A2"
		orientation = 'horizontal'
		expect(player.board).to receive(:place)
		player.place(coordinate,orientation)
	end

	it 'once a ship is placed the player no longer has it' do
		coordinate = "A2"
		orientation = 'horizontal'
		allow(player.board).to receive(:place)
		player.place(coordinate,orientation)
		expect(player.ships.count).to eq 3
	end
end