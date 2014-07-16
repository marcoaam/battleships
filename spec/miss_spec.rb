require 'miss'

describe Miss do

 it 'raises an error when attacking a cell with miss' do
 		miss = Miss.new
 		expect{miss.attack!}.to raise_error(RuntimeError)
 end

end