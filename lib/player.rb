require_relative 'board'
require_relative 'ship'

class Player

	attr_reader :name, :board
	attr_accessor :ships

	def initialize( name, board, ships)
		@ships = ships
		@board = board
		@name = name 
	end

	def shoot_at(opponent, coordinate)
		opponent.board.attacked_at(coordinate)
	end

	def place(ship, coordinate, orientation)
		board.place(ship, coordinate, orientation)
	end

end