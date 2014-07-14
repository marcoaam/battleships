class Board

	attr_accessor :grid_hash, :tracking, :personal

	def initialize(x=10, y=10)
		@personal = create_grid(x,y)
		@tracking = create_grid(x,y)
	end

	def create_grid(x=10,y=10)
		@grid_hash = {}
  	(1..x).each do |letter|
    	(1..y).each do |number|
      @grid_hash["#{(letter+64).chr}#{number}".to_sym] = nil
    	end
  	end
	end

	def coordinates_to_take(ship, coordinates, orientation='h')
		return horizontal(ship, coordinates) if orientation == 'h'
		vertical(ship, coordinates)
	end

	def horizontal(ship, coordinates)
		first_letter, last_letter = coordinates.chars.first, coordinates.chars.last
		(0...ship.length).map { |number| (first_letter.bytes.first + number).chr + last_letter }
	end

	def vertical(ship, coordinates)
		first_letter, last_letter = coordinates.chars.first, coordinates.chars.last.to_i
		(0...ship.length).map { |number| first_letter + (last_letter + number) }
	end
	
end