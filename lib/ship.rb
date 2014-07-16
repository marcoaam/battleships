class Hit
end

class Ship

	attr_reader :number_of_hits, :length
	attr_accessor :position

	DEFAULT_LENGTH = 2

	def initialize(options={})
		@number_of_hits ||= 0
		@length = options.fetch(:length, DEFAULT_LENGTH)
	end

	def attack!
		take_a_hit
		Hit.new
	end

	def sunk?
		number_of_hits == length
	end

	def take_a_hit
		@number_of_hits += 1
	end

	def self.carrier
		new(length: 5)
	end

	def self.battleship
		new(length: 4)
	end

	def self.submarine
		new(length: 3)
	end

	def self.patrol
		new(length: 2)
	end

end