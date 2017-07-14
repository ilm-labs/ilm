require 'require_all'
require 'unitwise'

require_rel '../lib'

# Root module. Everything in the gem goes inside this
module Eulim
end

Ch    =   Eulim::Chemistry
Elem  =   Ch::Element
Comp  =   Ch::Compound
Rxn   =   Ch::Reaction
Sub   =   Ch::Substance

Cl    =   Eulim::Chemical
Rcts  =   Cl::Reactors
Rct   =   Rcts::Reactor
Br    =   Rcts::Batch
Cstr  =   Rcts::CSTR
Pfr   =   Rcts::PFR

def Unitwise(*args)
  regex = /(\d+)(.*)/
  args = args.first.scan(regex).first.collect(&:strip) if args.count == 1
  Unitwise::Measurement.new(*args.first.to_f, *args.last)
end
