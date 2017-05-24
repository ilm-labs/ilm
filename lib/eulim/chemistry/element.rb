module Eulim::Chemistry
	class Element

		VALID_SYMBOL_REGEXP = /[A-Z][a-z]{0,2}/
		VALID_NAME_REGEXP = /[A-Z][a-z]+/

		attr_accessor :atomic_mass, :symbol, :name, :atomic_number

		@@attributes = ['symbol', 'name', 'atomic_number', 'atomic_mass']
		@@elements = [
			{ symbol:'H',	name: 'Hydrogen', 		atomic_number: 1,	atomic_mass: 1.0079 },
			{ symbol:'He',	name: 'Helium', 		atomic_number: 2,	atomic_mass: 4.002602 },
			{ symbol:'Li',	name: 'Lithium', 		atomic_number: 3,	atomic_mass: 6.941 },
			{ symbol:'Be',	name: 'Beryllium',		atomic_number: 4,	atomic_mass: 9.012182 },
			{ symbol:'B',	name: 'Boron',			atomic_number: 5,	atomic_mass: 10.811 },
			{ symbol:'C',	name: 'Carbon',			atomic_number: 6,	atomic_mass: 12.0107 },
			{ symbol:'N',	name: 'Nitrogen',		atomic_number: 7,	atomic_mass: 14.0067 },
			{ symbol:'O',	name: 'Oxygen',			atomic_number: 8,	atomic_mass: 15.9996 },
			{ symbol:'F',	name: 'Fluorine',		atomic_number: 9,	atomic_mass: 18.9984 },
			{ symbol:'Ne',	name: 'Neon',			atomic_number: 10,	atomic_mass: 20.1797 },
			{ symbol:'Na',	name: 'Sodium',			atomic_number: 11,	atomic_mass: 22.9897 },
			{ symbol:'Mg',	name: 'Magnesium',		atomic_number: 12,	atomic_mass: 24.305 },
			{ symbol:'Al',	name: 'Aluminium',		atomic_number: 13,	atomic_mass: 26.9815 },
			{ symbol:'Si',	name: 'Silicon',		atomic_number: 14,	atomic_mass: 28.0855 },
			{ symbol:'P',	name: 'Phosphorus',		atomic_number: 15,	atomic_mass: 30.9738 },
			{ symbol:'S',	name: 'Sulfur',			atomic_number: 16,	atomic_mass: 32.065 },
			{ symbol:'Cl',	name: 'Chlorine',		atomic_number: 17,	atomic_mass: 35.453 },
			{ symbol:'Ar',	name: 'Argon',			atomic_number: 18,	atomic_mass: 39.948 },
			{ symbol:'K',	name: 'Potassium',		atomic_number: 19,	atomic_mass: 39.0983 },
			{ symbol:'Ca',	name: 'Calcium',		atomic_number: 20,	atomic_mass: 40.078 },
			{ symbol:'Sc',	name: 'Scandium',		atomic_number: 21,	atomic_mass: 44.9559 },
			{ symbol:'Ti',	name: 'Titanium',		atomic_number: 22,	atomic_mass: 47.867 },
			{ symbol:'V',	name: 'Vanadium',		atomic_number: 23,	atomic_mass: 50.9415 },
			{ symbol:'Cr',	name: 'Chromium',		atomic_number: 24,	atomic_mass: 51.9961 },
			{ symbol:'Mn',	name: 'Manganese',		atomic_number: 25,	atomic_mass: 54.938 },
			{ symbol:'Fe',	name: 'Iron',			atomic_number: 26,	atomic_mass: 55.845 },
			{ symbol:'Co',	name: 'Cobalt',			atomic_number: 27,	atomic_mass: 58.9332 },
			{ symbol:'Ni',	name: 'Nickel',			atomic_number: 28,	atomic_mass: 58.6934 }
		]

		private
			def self.method_missing m, *args
				if m.to_s.start_with?("get_by_")
					attribute = m.to_s.split("get_by_").last
					if @@attributes.include? attribute
						args[0] = attribute == 'name' ? args[0].capitalize : args[0]
						element_data = self.all.select { |element| element[attribute.to_sym] === args[0]}.first
						if element_data
							new(element_data)
						else
							raise "Element not found"
						end
					else
						raise NameError, "Element class does not have that attribute or method"
					end
				else
					super
				end
			end

			def self.all
				@@elements
			end

			def initialize args
				if args
					args.each do |k,v|
						instance_variable_set("@#{k}", v) unless v.nil?
					end
				else
					nil
				end
			end
	end
end