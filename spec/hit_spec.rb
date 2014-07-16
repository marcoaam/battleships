require 'hit'

describe Hit do

 it 'raises an error when attacking a cell with miss' do
 		hit = Hit.new
 		expect{hit.attack!}.to raise_error(RuntimeError)
 end

end