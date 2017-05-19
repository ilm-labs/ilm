module Eulim::Chemistry
	class Element

		@@elements = [
			{ symbol:'H', name: 'Hydrogen', atomic_number: 1, atomic_mass: 1.0079 },
      { symbol:'He', name: 'Helium', atomic_number: 2, atomic_mass: 4.002602 },
      { symbol:'Li', name: 'Lithium', atomic_number: 3, atomic_mass: 6.941 },
      { symbol:'Be', name: 'Beryllium', atomic_number: 4, atomic_mass: 9.012182 },
      { symbol:'B', name: 'Boron', atomic_number: 5, atomic_mass: 10.811 },
      { symbol:'C', name: 'Carbon', atomic_number: 6, atomic_mass: 12.0107 },
      { symbol:'N', name: 'Nitrogen', atomic_number: 7, atomic_mass: 14.0067 },
      { symbol:'O', name: 'Oxygen', atomic_number: 8, atomic_mass: 15.9996 },
      { symbol:'F', name: 'Fluorine', atomic_number: 9, atomic_mass: 18.9984 },
      { symbol:'Ne', name: 'Neon', atomic_number: 10, atomic_mass: 20.1797 },
      { symbol:'Na', name: 'Sodium', atomic_number: 11, atomic_mass: 22.9897 },
      { symbol:'Mg', name: 'Magnesium', atomic_number: 12, atomic_mass: 24.305 }
		]

		def initialize args
      args.each do |k,v|
        instance_variable_set("@#{k}", v) unless v.nil?
      end
		end

		def self.all
			@@elements
		end

    def self.get_by_symbol(symbol)
      new(self.all.select { |element| element[:symbol] === symbol }.first)
    end

    def self.get_by_atomic_number(z)
      new(self.all.select { |element| element[:atomic_number] === z }.first)
    end

	end
end