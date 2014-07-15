require 'board'

describe Board do

	let(:board) { Board.new }

	it 'Creates a new grid empty by default' do
  	board.create_grid(2,2)
  	expect(board.grid).to eq ({'A1' => nil, 'A2' => nil, 'B1' => nil, 'B2' => nil})
  end

  it 'it has a personal board created with a default size of 10 x 10' do
    board2 = Board.new(1,1)
  	expect(board2.grid).to eq ({'A1' => nil})
  end

  it 'get the coodinates that the ship will take' do
    ship = double :ship, length: 2
    coordinates = "A1"
    expect(board.coordinates_to_take(ship, coordinates)).to eq ["A1", "B1"]
  end

  it 'it can determine the horizontal coordinates providing a ship length and start coordinate' do
    ship = double :ship, length: 2
    coordinates = "B1"
    expect(board.horizontal(ship, coordinates)).to eq ["B1", "C1"]
  end

  it 'it can determine the vertical coordinates providing a ship length and start coordinate' do
    ship = double :ship, length: 2
    coordinates = "A2"
    expect(board.vertical(ship, coordinates)).to eq ["A2", "A3"]
  end

  it 'places the ship inside of the board' do
    ship = double :ship, length: 2
    coordinates = "A2"
    board.place(ship, coordinates)
    expect(board.grid["A2"]).to eq ship
    expect(board.grid["B2"]).to eq ship
  end

end