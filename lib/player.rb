require './lib/board'
require './lib/ship'

class Player

	attr_reader :name, :board
	attr_accessor :ships

	def initialize(option = {})
		@ships = [ carrier = Ship.carrier, battleship = Ship.battleship, submarine = Ship.submarine, patrol = Ship.patrol ]
		@board = Board.new
		@name = option.fetch(:name, "player1")
	end

	def shoot_at(player, coordinate)
		player.board.attacked_at(coordinate) 
	end

	def place(coordinate, orientation)
		ship = @ships.pop
		board.place(ship, coordinate, orientation)
	end

end

