require 'cell'

describe Cell do 

	let(:cell) { Cell.new }

	it 'has water as its content when created' do
		expect(cell.content).to be_an_instance_of Water
	end

	it 'can take ships as its content' do
		ship = double :ship
		cell = Cell.new(ship)
		expect(cell.content).to eq ship
	end

	it 'can be attacked' do
		expect(cell.content).to receive(:attack!)
		cell.attack!
	end

	

end