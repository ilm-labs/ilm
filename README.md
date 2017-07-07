# Eulim

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'eulim'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install eulim

## Modules

* Structrues
* Chemistry

### Structures
* Pipe

### Chemistry

* Element
* Compound
* Reaction

#### Element

* H, He, Li, Be, B, C, N, O, F, Ne, Na, Mg, Al, Si, P, S, Cl, Ar, K , Ca, Sc, Ti, V, Cr, Mn, Fe, Co, Ni, Cu, Zn, Ga, Ge, As, Se, Br, Kr, Rb, Sr, Y, Zr, Nb, Mo, Tc, Ru, Rh, Pd, Ag, Cd, In, Sn, Sb, Te, I, Xe, Cs, Ba, La, Ce, Pr, Nd, Pm, Sm, Eu, Gd, Tb, Dy, Ho, Er, Tm, Yb, Lu, Hf, Ta, W, Re, Os, Ir, Pt, Au, Hg, Tl, Pb, Bi, Po, At, Rn, Fr, Ra, Ac, Th, Pa, U, Np, Pu, Am, Cm, Bk, Cf, Es, Fm, Md, No, Lr, Rf, Db, Sg, Bh, Hs, Mt,
* attributes: symbol, name, atomic_number, atomic_mass
* methods: get_by_* (* can be any of the attributes)

#### Compound

* attributes: formula, molecular_mass, constituents
* methods: new('compound formula')

### Reaction

* attributes: equation, is_valid, is_balanced, species, balanced_eqn
* methods: new("Put your reaction string here")      #For eg: ('2Na(s) + 2HCl(aq) >> 2NaCl(aq) + H2(g)')

## Usage
```bash
$ Eulim::Chemistry::Element.get_by_symbol "H"
=> #<Eulim::Chemistry::Element:0x000000025e5ab8 @name="Hydrogen", @symbol="H", @atomic_number=1, @atomic_mass=#<Unitwise::Measurement value=1.0079 unit=u>>

$ Eulim::Chemistry::Element.get_by_atomic_number 12
=> #<Eulim::Chemistry::Element:0x00000002c87560 @name="Magnesium", @symbol="Mg", @atomic_number=12, @atomic_mass=#<Unitwise::Measurement value=24.305 unit=u>>

$ Eulim::Chemistry::Element.get_by_name "helium" # or "Helium"
=> #<Eulim::Chemistry::Element:0x00000002ca66e0 @name="Helium", @symbol="He", @atomic_number=2, @atomic_mass=#<Unitwise::Measurement value=4.002602 unit=u>>

$ Eulim::Chemistry::Compound.new("CaCO3")
=> #<Eulim::Chemistry::Compound:0x00000002a65340 @formula="CaCO3", @constituents={"Ca"=>{:element=>#<Eulim::Chemistry::Element:0x00000002c805a8 @name="Calcium", @symbol="Ca", @atomic_number=20, @atomic_mass=#<Unitwise::Measurement value=40.078 unit=u>>, :atom_count=>1}, "C"=>{:element=>#<Eulim::Chemistry::Element:0x00000002c8f6e8 @name="Carbon", @symbol="C", @atomic_number=6, @atomic_mass=#<Unitwise::Measurement value=12.0107 unit=u>>, :atom_count=>1}, "O"=>{:element=>#<Eulim::Chemistry::Element:0x00000002c8dc30 @name="Oxygen", @symbol="O", @atomic_number=8, @atomic_mass=#<Unitwise::Measurement value=15.9996 unit=u>>, :atom_count=>3}}, @molecular_mass=#<Unitwise::Measurement value=100.0875 unit=u>>

$Eulim::Chemistry::Reaction.new(equation: 'KMnO4 + HCl >> KCl + MnCl2 + H2O + Cl2').balanced_eqn
 => "2KMnO4 + 16HCl >> 2KCl + 2MnCl2 + 8H2O + 5Cl2"

$ Eulim::Chemistry::Reaction.new(equation: '2Na(s) + 2HCl(aq) >> 2NaCl(aq) + H2(g)').equation
 => "2Na(s) + 2HCl(aq) >> 2NaCl(aq) + H2(g)" 
 
$ Eulim::Chemistry::Reaction.new(equation: '2Na(s) + 2HCl(aq) >> 2NaCl(aq) + H2(g)').is_valid
=> true 
 
$ Eulim::Chemistry::Reaction.new(equation: '2Na(s) + 2HCl(aq) >> 2NaCl(aq) + H2(g)').is_balanced
=> true 
 
$ Eulim::Chemistry::Reaction.new(equation: '2Na(s) + 2HCl(aq) >> 2NaCl(aq) + H2(g)').species
=> {:reactants=>{"Na"=>{:compound=>#<Eulim::Chemistry::Compound:0x00000002ca6910 @formula="Na", @constituents={"Na"=>{:element=>#<Eulim::Chemistry::Element:0x00000002c88e10 @name="Sodium", @symbol="Na", @atomic_number=11, @atomic_mass=#<Unitwise::Measurement value=22.9897 unit=u>>, :atom_count=>1}}, @molecular_mass=#<Unitwise::Measurement value=22.9897 unit=u>>, :stoichiometry=>2, :state=>"solid"}, "HCl"=>{:compound=>#<Eulim::Chemistry::Compound:0x00000002c90ed0 @formula="HCl", @constituents={"H"=>{:element=>#<Eulim::Chemistry::Element:0x000000025e5ab8 @name="Hydrogen", @symbol="H", @atomic_number=1, @atomic_mass=#<Unitwise::Measurement value=1.0079 unit=u>>, :atom_count=>1}, "Cl"=>{:element=>#<Eulim::Chemistry::Element:0x00000002c82c90 @name="Chlorine", @symbol="Cl", @atomic_number=17, @atomic_mass=#<Unitwise::Measurement value=35.453 unit=u>>, :atom_count=>1}}, @molecular_mass=#<Unitwise::Measurement value=36.4609 unit=u>>, :stoichiometry=>2, :state=>"aqueous"}}, :products=>{"NaCl"=>{:compound=>#<Eulim::Chemistry::Compound:0x00000002c73bf0 @formula="NaCl", @constituents={"Na"=>{:element=>#<Eulim::Chemistry::Element:0x00000002c88e10 @name="Sodium", @symbol="Na", @atomic_number=11, @atomic_mass=#<Unitwise::Measurement value=22.9897 unit=u>>, :atom_count=>1}, "Cl"=>{:element=>#<Eulim::Chemistry::Element:0x00000002c82c90 @name="Chlorine", @symbol="Cl", @atomic_number=17, @atomic_mass=#<Unitwise::Measurement value=35.453 unit=u>>, :atom_count=>1}}, @molecular_mass=#<Unitwise::Measurement value=58.4427 unit=u>>, :stoichiometry=>2, :state=>"aqueous"}, "H2"=>{:compound=>#<Eulim::Chemistry::Compound:0x00000002c34180 @formula="H2", @constituents={"H"=>{:element=>#<Eulim::Chemistry::Element:0x000000025e5ab8 @name="Hydrogen", @symbol="H", @atomic_number=1, @atomic_mass=#<Unitwise::Measurement value=1.0079 unit=u>>, :atom_count=>2}}, @molecular_mass=#<Unitwise::Measurement value=2.0158 unit=u>>, :stoichiometry=>1, :state=>"gaseous"}}}

$ Eulim::Chemistry::Reaction.new(equation: '2Na(s) + 2HCl(aq) >> 2NaCl(aq) + H2(g)')
=> #<Eulim::Chemistry::Reaction:0x00000002ce22f8 @equation="2Na(s) + 2HCl(aq) >> 2NaCl(aq) + H2(g)", @species={:reactants=>{"Na"=>{:compound=>#<Eulim::Chemistry::Compound:0x00000002ce1d80 @formula="Na", @constituents={"Na"=>{:element=>#<Eulim::Chemistry::Element:0x00000002c88e10 @name="Sodium", @symbol="Na", @atomic_number=11, @atomic_mass=#<Unitwise::Measurement value=22.9897 unit=u>>, :atom_count=>1}}, @molecular_mass=#<Unitwise::Measurement value=22.9897 unit=u>>, :stoichiometry=>2, :state=>"solid"}, "HCl"=>{:compound=>#<Eulim::Chemistry::Compound:0x00000002cabdc0 @formula="HCl", @constituents={"H"=>{:element=>#<Eulim::Chemistry::Element:0x000000025e5ab8 @name="Hydrogen", @symbol="H", @atomic_number=1, @atomic_mass=#<Unitwise::Measurement value=1.0079 unit=u>>, :atom_count=>1}, "Cl"=>{:element=>#<Eulim::Chemistry::Element:0x00000002c82c90 @name="Chlorine", @symbol="Cl", @atomic_number=17, @atomic_mass=#<Unitwise::Measurement value=35.453 unit=u>>, :atom_count=>1}}, @molecular_mass=#<Unitwise::Measurement value=36.4609 unit=u>>, :stoichiometry=>2, :state=>"aqueous"}}, :products=>{"NaCl"=>{:compound=>#<Eulim::Chemistry::Compound:0x00000002c8cda8 @formula="NaCl", @constituents={"Na"=>{:element=>#<Eulim::Chemistry::Element:0x00000002c88e10 @name="Sodium", @symbol="Na", @atomic_number=11, @atomic_mass=#<Unitwise::Measurement value=22.9897 unit=u>>, :atom_count=>1}, "Cl"=>{:element=>#<Eulim::Chemistry::Element:0x00000002c82c90 @name="Chlorine", @symbol="Cl", @atomic_number=17, @atomic_mass=#<Unitwise::Measurement value=35.453 unit=u>>, :atom_count=>1}}, @molecular_mass=#<Unitwise::Measurement value=58.4427 unit=u>>, :stoichiometry=>2, :state=>"aqueous"},"H2"=>{:compound=>#<Eulim::Chemistry::Compound:0x00000002c6f938 @formula="H2", @constituents={"H"=>{:element=>#<Eulim::Chemistry::Element:0x000000025e5ab8 @name="Hydrogen", @symbol="H", @atomic_number=1, @atomic_mass=#<Unitwise::Measurement value=1.0079 unit=u>>, :atom_count=>2}}, @molecular_mass=#<Unitwise::Measurement value=2.0158 unit=u>>, :stoichiometry=>1, :state=>"gaseous"}}}, @is_valid=true, @is_balanced=true> 
```
## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/syedfazilbasheer-quester/eulim-gem. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

