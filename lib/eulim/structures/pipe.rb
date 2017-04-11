module Eulim
	module Structures
		class Pipe < Structure
			def initialize(*args)
			end

			def self.requirements
				"gimme radius, length, thickness, material..."
			end
		end
	end
end