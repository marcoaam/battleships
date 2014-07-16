require 'board'

describe Board do

  let(:board) { Board.new }

  it 'Creates a new grid empty by default' do
    board = Board.new
    board.create_grid(1,1)
    expect(board.grid_hash["A1"]).to be_an_instance_of Cell
  end

  it 'it has a personal board created with a default size of 10 x 10' do
    board = Board.new
    expect(board.personal).to eq (board.create_grid)
  end

  it 'it has a tracking board that looks the same as the personal board' do
    board = Board.new
    expect(board.tracking).to eq (board.create_grid)
  end

  it 'get the coodinates that the ship take' do
    ship = double :ship, length: 2
    coordinate = "A1"
    expect(board.get_coordinates_for(ship, starting_on: coordinate, running: "horizontal")).to eq ["A1", "B1"]
  end

  it 'get the coodinates that the ship take' do
    ship = double :ship, length: 2
    coordinate = "A1"
    expect(board.get_coordinates_for(ship, starting_on: coordinate, running: "horizontal")).to eq ["A1", "B1"]
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

  it "can place a ship on multiple coordinates" do
    ship = double :ship, length: 2
    coordinates = "A1"
    running = 'horizontal'
    board.place(ship, coordinates, running)
    expect(board.grid_hash["A1"].content).to be ship
    expect(board.grid_hash["B1"].content).to be ship
  end

  it 'can record an attack into the grid cells' do
    coordinate = "A1"
    board.attacked_at(coordinate)
    expect(board.grid_hash[coordinate].content).to be_an_instance_of Miss
  end

end