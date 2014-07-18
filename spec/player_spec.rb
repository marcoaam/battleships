require 'player'

describe Player do

let(:board) { double :board }
let(:ships) { [ship, ship1] }
let(:ship) { double :ship }
let(:ship1) { double :ship }
let (:player) {Player.new("Michiel",board, ships)}

	it 'has a name' do
		expect(player.name).to eq "Michiel"
	end

	it 'expect the player to have a board' do
		expect(player.board).to eq board
	end

	it 'expect the player to start with 4 ships' do
		expect(player.ships.count).to eq 2
	end

	it 'expect the first ship to be an instance of the Ship class' do
		expect(player.ships.first).to eq ship
	end

	it 'can shoot at each other' do
		coordinate = "A2"
		marco_attacking = Player.new("Michiel", board, ships)
		chloe_receiving = Player.new("Marco", board, ships)
		expect(chloe_receiving.board).to receive(:attacked_at).with(coordinate)
		marco_attacking.shoot_at(chloe_receiving,coordinate)
	end

	it 'passes the ship and coordinates to the board so the ship to be placed' do
		coordinate = "A2"
		orientation = 'horizontal'
		expect(player.board).to receive(:place)
		player.place(ship, coordinate,orientation)
	end
end