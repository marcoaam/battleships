require './lib/water'

class Cell

	attr_accessor :content

	def initialize(content=Water.new)
		@content = content
	end

	def attack!
		@content = @content.attack!
	end
	
end