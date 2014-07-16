require './lib/cell'

class Board

	attr_accessor :grid_hash, :tracking, :personal

	def initialize(x=10, y=10)
		@personal = create_grid(x,y)
		@tracking = create_grid(x,y)
	end

	def create_grid(x=10,y=10)
		@grid_hash = {}
  	(1..x).each do |letter_number|
    	(1..y).each do |number|
      @grid_hash["#{(letter_number+64).chr}#{number}"] = Cell.new
    	end
  	end
	end

	def get_coordinates_for(ship, starting_on: coordinates, running: 'horizontal')
		return horizontal(ship, starting_on) if running == 'horizontal'
		vertical(ship, starting_on)
	end

	def horizontal(ship, coordinates)
		coordinate_letter, coordinate_number = coordinates.chars.first, coordinates.chars.last
		(0...ship.length).map { |number| (coordinate_letter.bytes.first + number).chr + coordinate_number }
	end

	def vertical(ship, coordinates)
		coordinate_letter, coordinate_number = coordinates.chars.first, coordinates.chars.last.to_i
		(0...ship.length).map { |number| coordinate_letter + (coordinate_number + number).to_s }
	end
	
	def place(ship, coordinates, orientation)
		get_coordinates_for(ship, starting_on: coordinates, running: orientation).each do |coordinate|
			grid_hash[coordinate].content = ship if grid_hash.include?(coordinate)
		end
	end
end