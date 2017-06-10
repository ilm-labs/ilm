module Eulim::Chemistry
  class Element

    VALID_SYMBOL_REGEXP = /[A-Z][a-z]{0,2}/
    VALID_NAME_REGEXP = /[A-Z][a-z]+/

    attr_accessor :atomic_mass, :symbol, :name, :atomic_number

    @@attributes = ['symbol', 'name', 'atomic_number', 'atomic_mass']
    #Data taken from 'www.science.co.il/elements/'
    @@elements = [
      { symbol:'H',   name: 'Hydrogen',     atomic_number: 1, atomic_mass: 1.0079 },
      { symbol:'He',  name: 'Helium',     atomic_number: 2, atomic_mass: 4.002602 },
      { symbol:'Li',  name: 'Lithium',    atomic_number: 3, atomic_mass: 6.941 },
      { symbol:'Be',  name: 'Beryllium',    atomic_number: 4, atomic_mass: 9.012182 },
      { symbol:'B',   name: 'Boron',      atomic_number: 5, atomic_mass: 10.811 },
      { symbol:'C',   name: 'Carbon',     atomic_number: 6, atomic_mass: 12.0107 },
      { symbol:'N',   name: 'Nitrogen',   atomic_number: 7, atomic_mass: 14.0067 },
      { symbol:'O',   name: 'Oxygen',     atomic_number: 8, atomic_mass: 15.9996 },
      { symbol:'F',   name: 'Fluorine',   atomic_number: 9, atomic_mass: 18.9984 },
      { symbol:'Ne',  name: 'Neon',     atomic_number: 10,  atomic_mass: 20.1797 },
      { symbol:'Na',  name: 'Sodium',     atomic_number: 11,  atomic_mass: 22.9897 },
      { symbol:'Mg',  name: 'Magnesium',    atomic_number: 12,  atomic_mass: 24.305 },
      { symbol:'Al',  name: 'Aluminium',    atomic_number: 13,  atomic_mass: 26.9815 },
      { symbol:'Si',  name: 'Silicon',    atomic_number: 14,  atomic_mass: 28.0855 },
      { symbol:'P',   name: 'Phosphorus',   atomic_number: 15,  atomic_mass: 30.9738 },
      { symbol:'S',   name: 'Sulfur',     atomic_number: 16,  atomic_mass: 32.065 },
      { symbol:'Cl',  name: 'Chlorine',   atomic_number: 17,  atomic_mass: 35.453 },
      { symbol:'Ar',  name: 'Argon',      atomic_number: 18,  atomic_mass: 39.948 },
      { symbol:'K',   name: 'Potassium',    atomic_number: 19,  atomic_mass: 39.0983 },
      { symbol:'Ca',  name: 'Calcium',    atomic_number: 20,  atomic_mass: 40.078 },
      { symbol:'Sc',  name: 'Scandium',   atomic_number: 21,  atomic_mass: 44.9559 },
      { symbol:'Ti',  name: 'Titanium',   atomic_number: 22,  atomic_mass: 47.867 },
      { symbol:'V',   name: 'Vanadium',   atomic_number: 23,  atomic_mass: 50.9415 },
      { symbol:'Cr',  name: 'Chromium',   atomic_number: 24,  atomic_mass: 51.9961 },
      { symbol:'Mn',  name: 'Manganese',    atomic_number: 25,  atomic_mass: 54.938 },
      { symbol:'Fe',  name: 'Iron',           atomic_number: 26,  atomic_mass: 55.845 },
      { symbol:'Co',  name: 'Cobalt',         atomic_number: 27,  atomic_mass: 58.9332 },
      { symbol:'Ni',  name: 'Nickel',         atomic_number: 28,  atomic_mass: 58.6934 },
      { symbol:'Cu',  name: 'Copper',         atomic_number: 29,  atomic_mass: 63.546 },
      { symbol:'Zn',  name: 'Zinc',           atomic_number: 30,  atomic_mass: 65.39 },
      { symbol:'Ga',  name: 'Gallium',        atomic_number: 31,  atomic_mass: 69.723 },
      { symbol:'Ge',  name: 'Germanium',      atomic_number: 32,  atomic_mass: 72.64 },
      { symbol:'As',  name: 'Arsenic',        atomic_number: 33,  atomic_mass: 74.9216 },
      { symbol:'Se',  name: 'Selenium',       atomic_number: 34,  atomic_mass: 78.96 },
      { symbol:'Br',  name: 'Bromine',        atomic_number: 35,  atomic_mass: 79.904 },
      { symbol:'Kr',  name: 'Krypton',        atomic_number: 36,  atomic_mass: 83.3 },
      { symbol:'Rb',  name: 'Rubidium',       atomic_number: 37,  atomic_mass: 85.4678 },
      { symbol:'Sr',  name: 'Strontium',      atomic_number: 38,  atomic_mass: 87.62 },
      { symbol:'Y',   name: 'Yttrium',        atomic_number: 39,  atomic_mass: 88.9059 },
      { symbol:'Zr',  name: 'Zirconium',      atomic_number: 40,  atomic_mass: 91.224 },
      { symbol:'Nb',  name: 'Niobium',        atomic_number: 41,  atomic_mass: 92.9064 },
      { symbol:'Mo',  name: 'Molybdenum',     atomic_number: 42,  atomic_mass: 95.94 },
      { symbol:'Tc',  name: 'Technitium',     atomic_number: 43,  atomic_mass: 98 },
      { symbol:'Ru',  name: 'Ruthenium',      atomic_number: 44,  atomic_mass: 101.07 },
      { symbol:'Rh',  name: 'Rhodium',        atomic_number: 45,  atomic_mass: 102.9055 },
      { symbol:'Pd',  name: 'Palladium',      atomic_number: 46,  atomic_mass: 106.42 },
      { symbol:'Ag',  name: 'Silver',         atomic_number: 47,  atomic_mass: 107.8682 },
      { symbol:'Cd',  name: 'Cadmiuim',       atomic_number: 48,  atomic_mass: 112.411 },
      { symbol:'In',  name: 'Indium',         atomic_number: 49,  atomic_mass: 114.818 },
      { symbol:'Sn',  name: 'Tin',            atomic_number: 50,  atomic_mass: 118.71 },
      { symbol:'Sb',  name: 'Antimony',       atomic_number: 51,  atomic_mass: 121.76 },
      { symbol:'Te',  name: 'Tellurium',      atomic_number: 52,  atomic_mass: 127.6 },
      { symbol:'I',   name: 'Iodine',         atomic_number: 53,  atomic_mass: 126.9045 },
      { symbol:'Xe',  name: 'Xenon',          atomic_number: 54,  atomic_mass: 131.293 },
      { symbol:'Cs',  name: 'Cesium',         atomic_number: 55,  atomic_mass: 132.9055 },
      { symbol:'Ba',  name: 'Barium',         atomic_number: 56,  atomic_mass: 137.327 },
      { symbol:'La',  name: 'Lanthanum',      atomic_number: 57,  atomic_mass: 138.9055 },
      { symbol:'Ce',  name: 'Cerium',         atomic_number: 58,  atomic_mass: 140.116 },
      { symbol:'Pr',  name: 'Praseodymium',   atomic_number: 59,  atomic_mass: 140.9077 },
      { symbol:'Nd',  name: 'Neodymium',      atomic_number: 60,  atomic_mass: 144.24 },
      { symbol:'Pm',  name: 'Promethium',     atomic_number: 61,  atomic_mass: 145 },
      { symbol:'Sm',  name: 'Samarium',       atomic_number: 62,  atomic_mass: 150.36 },
      { symbol:'Eu',  name: 'Europium',       atomic_number: 63,  atomic_mass: 151.964 },
      { symbol:'Gd',  name: 'Gadolium',       atomic_number: 64,  atomic_mass: 157.25 },
      { symbol:'Tb',  name: 'Terbium',        atomic_number: 65,  atomic_mass: 158.9253 },
      { symbol:'Dy',  name: 'Dysprosium',     atomic_number: 66,  atomic_mass: 162.5 },
      { symbol:'Ho',  name: 'Holmium',        atomic_number: 67,  atomic_mass: 164.9303 },
      { symbol:'Er',  name: 'Erbium',         atomic_number: 68,  atomic_mass: 167.259 },
      { symbol:'Tm',  name: 'Thulium',        atomic_number: 69,  atomic_mass: 168.9342 },
      { symbol:'Yb',  name: 'Ytterbium',      atomic_number: 70,  atomic_mass: 173.04 },
      { symbol:'Lu',  name: 'Lutetium',       atomic_number: 71,  atomic_mass: 174.967 },
      { symbol:'Hf',  name: 'Hafnium',        atomic_number: 72,  atomic_mass: 178.49 },
      { symbol:'Ta',  name: 'Tantalum',       atomic_number: 73,  atomic_mass: 180.9479 },
      { symbol:'W',   name: 'Tungsten',       atomic_number: 74,  atomic_mass: 183.84 },
      { symbol:'Re',  name: 'Rhenium',        atomic_number: 75,  atomic_mass: 186.207 },
      { symbol:'Os',  name: 'Osmium',         atomic_number: 76,  atomic_mass: 190.23 },
      { symbol:'Ir',  name: 'Iridium',        atomic_number: 77,  atomic_mass: 192.217 },
      { symbol:'Pt',  name: 'Platinum',       atomic_number: 78,  atomic_mass: 195.078 },
      { symbol:'Au',  name: 'Gold',           atomic_number: 79,  atomic_mass: 196.9665 },
      { symbol:'Hg',  name: 'Mercury',        atomic_number: 80,  atomic_mass: 200.59 },
      { symbol:'Tl',  name: 'Thallium',       atomic_number: 81,  atomic_mass: 204.3833 },
      { symbol:'Pb',  name: 'Lead',           atomic_number: 82,  atomic_mass: 207.2 },
      { symbol:'Bi',  name: 'Bismuth',        atomic_number: 83,  atomic_mass: 208.9804 },
      { symbol:'Po',  name: 'Polonium',       atomic_number: 84,  atomic_mass: 209 },
      { symbol:'At',  name: 'Astatine',       atomic_number: 85,  atomic_mass: 210 },
      { symbol:'Rn',  name: 'Radon',          atomic_number: 86,  atomic_mass: 222 },
      { symbol:'Fr',  name: 'Francium',       atomic_number: 87,  atomic_mass: 223 },
      { symbol:'Ra',  name: 'Radium',         atomic_number: 88,  atomic_mass: 226 },
      { symbol:'Ac',  name: 'Actinium',       atomic_number: 89,  atomic_mass: 227 },
      { symbol:'Th',  name: 'Thorium',        atomic_number: 90,  atomic_mass: 232.0381 },
      { symbol:'Pa',  name: 'Protactinium',   atomic_number: 91,  atomic_mass: 231.0359 },
      { symbol:'U',   name: 'Uranium',        atomic_number: 92,  atomic_mass: 238.0289 },
      { symbol:'Np',  name: 'Neptunum',       atomic_number: 93,  atomic_mass: 237 },
      { symbol:'Pu',  name: 'Plutonium',      atomic_number: 94,  atomic_mass: 244 },
      { symbol:'Am',  name: 'Americium',      atomic_number: 95,  atomic_mass: 243 },
      { symbol:'Cm',  name: 'Curium',         atomic_number: 96,  atomic_mass: 247 },
      { symbol:'Bk',  name: 'Berkilium',      atomic_number: 97,  atomic_mass: 247 },
      { symbol:'Cf',  name: 'Californium',    atomic_number: 98,  atomic_mass: 251 },
      { symbol:'Es',  name: 'Einsteinium',    atomic_number: 99,  atomic_mass: 252 },
      { symbol:'Fm',  name: 'Fermium',        atomic_number: 100,  atomic_mass: 257 },
      { symbol:'Md',  name: 'Mendelevium',    atomic_number: 101,  atomic_mass: 258 },
      { symbol:'No',  name: 'Nobelium',       atomic_number: 102,  atomic_mass: 259 },
      { symbol:'Lr',  name: 'Lawrencium',     atomic_number: 103,  atomic_mass: 262 },
      { symbol:'Rf',  name: 'Rutherfordium',  atomic_number: 104,  atomic_mass: 261 },
      { symbol:'Db',  name: 'Dubnium',        atomic_number: 105,  atomic_mass: 262 },
      { symbol:'Sg',  name: 'Seaborgium',     atomic_number: 106,  atomic_mass: 266 },
      { symbol:'Bh',  name: 'Bohrium',        atomic_number: 107,  atomic_mass: 264 },
      { symbol:'Hs',  name: 'Hassium',        atomic_number: 108,  atomic_mass: 277 },
      { symbol:'Mt',  name: 'Meitnerium',     atomic_number: 109,  atomic_mass: 268 }
                        
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