class Board

	attr_accessor :grid_hash

	def initialize
		@personal = create_grid
		@tracking = create_grid	
	end

	def personal
		@personal
	end

	def tracking
		@tracking
	end

	def create_grid(x=10,y=10)
		@grid_hash = {}
  	(1..x).each do |a|
    	(1..y).each do |b|
      @grid_hash["#{(a+64).chr}#{b}".to_sym] = nil
    	end
  	end
	end
	
end


# Hash creator

# def initialize(x=1,y=1)
#   @hash = {}
#   (1..x).each do |a|
#     (1..y).each do |b|
#       @hash["#{(a+64).chr}#{b}".to_sym] = nil
#     end
#   end
# end