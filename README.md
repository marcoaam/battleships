[![Code Climate](https://codeclimate.com/github/marcoaam/battleships/badges/gpa.svg)](https://codeclimate.com/github/marcoaam/battleships) [![Test Coverage](https://codeclimate.com/github/marcoaam/battleships/badges/coverage.svg)](https://codeclimate.com/github/marcoaam/battleships)

Battleships
===========

Week 4 at Makers Academy. Battleships terminal game. You can play battleships in the terminal.


Technologies used
-----------------

- Ruby
- RSpec
- Terminal Table


How to use
----------

	git clone git@github.com:marcoaam/battleships.git
	cd battleships
	bundle install
	irb
	require './lib/game_engine'
	game = Game.new
	game.create_match

Follow the instructions to place the ships and start shooting!!!


How to test
------------

	cd battleships
	rspec


Still needs to be done
---------------------

- Validation for wrong user input
- Validation for placing ships on top of other
- Validation for placing the ships out of the grid bounds


Pairing partners [Jenny](https://github.com/thejennywang), [Michiel](https://github.com/michielstigter) and Chloe.


