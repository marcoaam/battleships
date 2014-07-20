require 'board'

describe Board do

  let(:board) { Board.new }

  it 'Creates a new grid empty by default' do
    board = Board.new
    board.create_grid(1,1)
    expect(board.grid["A1"]).to be_an_instance_of Cell
  end

  it 'Creates a new grid empty by default' do
    board = Board.new
    expect(board.grid).to eq board.grid
  end

  it 'get the coodinates that the ship take horizontaly' do
    ship = double :ship, length: 2
    coordinate = "A1"
    expect(board.get_coordinates_for(ship, starting_on: coordinate, running: "horizontal")).to eq ["A1", "B1"]
  end

   it 'get the coodinates that the ship take verticaly' do
    ship = double :ship, length: 2
    coordinate = "A1"
    expect(board.get_coordinates_for(ship, starting_on: coordinate, running: "vertical")).to eq ["A1", "A2"]
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
    expect(board.grid["A1"].content).to be ship
    expect(board.grid["B1"].content).to be ship
  end

  it 'can receive an incoming attack' do
    coordinate = "A1"
    board.attacked_at(coordinate)
    expect(board.grid[coordinate].content).to be_an_instance_of Miss
  end

  it 'counts the ships left in the grid' do
    ship = double :ship, length: 5, is_a?: Ship
    coordinates = "A1"
    running = 'horizontal'
    board.place(ship, coordinates, running)
    expect(board.ships_remaining).to eq 1
  end
end