class Board

	attr_accessor :grid

	def initialize(x=10, y=10)
	  @grid = create_grid(x,y)
	end

	def create_grid(x=10,y=10)
		@grid = {}
  	(1..x).each do |letter_number|
    	(1..y).each do |number|
      @grid["#{(letter_number+64).chr}#{number}"] = nil
    	end
  	end
  	@grid
	end

	def coordinates_to_take(ship, coordinates, orientation = 'h')
		return horizontal(ship, coordinates) if orientation == 'h'
		vertical(ship, coordinates)
	end

	def horizontal(ship, coordinates)
		coordinate_letter, coordinate_number = coordinates.chars.first, coordinates.chars.last
		(0...ship.length).map { |number| (coordinate_letter.bytes.first + number).chr + coordinate_number }
	end

	def vertical(ship, coordinates)
		coordinate_letter, coordinate_number = coordinates.chars.first, coordinates.chars.last.to_i
		(0...ship.length).map { |number| coordinate_letter + (coordinate_number + number).to_s }
	end

	def place(ship, coordinates, orientation='h')
		(coordinates_to_take(ship,coordinates)).each { |ship_coordinate| @grid.each { |coordinate, value| @grid[coordinate] = ship if coordinate == ship_coordinate}}
	end
	
end