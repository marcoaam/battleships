require 'water'

describe Water do 

	it 'water can be attacked' do
	 	water = Water.new
	 	expect(water.attack!).to be_an_instance_of Miss
	end
end