require 'game_engine'

describe Game do

	let(:game) { Game.new }

	it 'promts for the player names when created' do
		expect(STDIN).to receive(:gets).and_return("Marco")
		expect(game.get_user_input).to eq "Marco"
	end

	it 'promts for the player names when created' do
		expect(game).to receive(:get_user_input)
		game.get_name
	end

	it 'can create boards' do
		expect(game.new_board).to be_a Board
	end

	it 'can a create a set of new ships to be pased to each player' do
		expect(game.set_of_ships["carrier"]).to be_a Ship
	end

	it 'can create players' do 
		allow(game).to receive(:get_name).and_return("Marco")
		expect(game.new_player).to be_a Player
	end

	it 'can create a match with 2 players' do
		allow(game).to receive(:get_name).and_return("Marco").at_least(:twice)
		allow(game).to receive(:get_ship_name).and_return("carrier").at_least(:twice)
		allow(game).to receive(:get_coordinates).and_return("A1").at_least(:twice)
		allow(game).to receive(:get_orientation).and_return("horizontal").at_least(:twice)
		
		expect(game).to receive(:select_ship_to_be_placed).with(Player).twice

		game.create_match
		
		expect(game.player1).to be_a Player
		expect(game.player2).to be_a Player
	end

	it 'promts for the player to enter coordinates' do
		expect(game).to receive(:get_user_input).and_return("A1")
		game.get_coordinates
	end

	it 'promts for the player to enter orientation' do
		expect(game).to receive(:get_user_input).and_return("vertical")
		game.get_orientation
	end

	it 'lets the player select a ship from his ships' do
		carrier = double :carrier
		player1 = double :player, name: "marco", ships: {"carrier" => carrier}, place: carrier
		allow(game).to receive(:get_ship_name).and_return("carrier")
		allow(game).to receive(:get_coordinates).and_return("A1")
		allow(game).to receive(:get_orientation).and_return("horizontal")

		expect(game.select_ship_to_be_placed(player1)).to eq nil
	end

	it 'promts for the player to enter ship name' do
		expect(game).to receive(:get_user_input).and_return("carrier")
		game.get_ship_name
	end

	it 'selects and delete a ship' do 
		ships = double(:ships)
		player = double(:player, ships: ships)

		expect(ships).to receive(:delete).with("carrier")
		game.delete_ship_from(player, "carrier")
	end

end