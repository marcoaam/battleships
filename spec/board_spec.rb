require 'board'

describe Board do

	let(:board) { Board.new }

	it 'Creates a new grid empty by default' do
  	board = Board.new
  	board.create_grid(2,2)
  	expect(board.grid_hash).to eq ({A1: nil, A2: nil, B1: nil, B2: nil})
  end

  it 'it has a personal board created with a default size of 10 x 10' do
  	board = Board.new
  	expect(board.personal).to eq (board.create_grid)
  end

  it 'it has a tracking board that looks the same as the personal board' do
  	board = Board.new
  	expect(board.tracking).to eq (board.create_grid)
  end

end