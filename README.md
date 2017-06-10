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

#### Element

* H, He, Li, Be, B, C, N, O, F, Ne, Na, Mg, Al, Si, P, S, Cl, Ar, K , Ca, Sc, Ti, V, Cr, Mn, Fe, Co, Ni, Cu, Zn, Ga, Ge, As, Se, Br, Kr, Rb, Sr, Y, Zr, Nb, Mo, Tc, Ru, Rh, Pd, Ag, Cd, In, Sn, Sb, Te, I, Xe, Cs, Ba, La, Ce, Pr, Nd, Pm, Sm, Eu, Gd, Tb, Dy, Ho, Er, Tm, Yb, Lu, Hf, Ta, W, Re, Os, Ir, Pt, Au, Hg, Tl, Pb, Bi, Po, At, Rn, Fr, Ra, Ac, Th, Pa, U, Np, Pu, Am, Cm, Bk, Cf, Es, Fm, Md, No, Lr, Rf, Db, Sg, Bh, Hs, Mt,
* attributes: symbol, name, atomic_number, atomic_mass
* methods: get_by_* (* can be any of the attributes)

#### Compound

* attributes: formula, molecular_mass, constituents
* methods: new(compound formula)

## Usage
```ruby
$ Eulim::Chemistry::Element.get_by_symbol "H"
=> #<Eulim::Chemistry::Element: @symbol="H", @name="Hydrogen", @atomic_number=1, @atomic_mass=1.0079>

$ Eulim::Chemistry::Element.get_by_atomic_number 12
=> #<Eulim::Chemistry::Element: @symbol="Mg", @name="Magnesium", @atomic_number=12, @atomic_mass=24.305>

$ Eulim::Chemistry::Element.get_by_name "helium" # or "Helium"
=> #<Eulim::Chemistry::Element: @symbol="He", @name="Helium", @atomic_number=2, @atomic_mass=4.002602>

$ Eulim::Chemistry::Compound.new("CaCO3")
=> #<Eulim::Chemistry::Compound: @formula="CaCO3", @constituents=[{:element=>#<Eulim::Chemistry::Element: @symbol="Ca", @name="Calcium", @atomic_number=20, @atomic_mass=40.078>, :atom_count=>1}, {:element=>#<Eulim::Chemistry::Element: @symbol="C", @name="Carbon", @atomic_number=6, @atomic_mass=12.0107>, :atom_count=>1}, {:element=>#<Eulim::Chemistry::Element: @symbol="O", @name="Oxygen", @atomic_number=8, @atomic_mass=15.9996>, :atom_count=>3}], @molecular_mass=100.0875>
```
## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/syedfazilbasheer-quester/eulim-gem. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

