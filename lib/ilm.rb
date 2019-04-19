require_relative 'matrix_overrides'
require_relative 'string_overrides'
require_relative 'class_overrides'
require 'unitwise'

# Root module. Everything in the gem goes inside this
module Ilm
end

def Unitwise(*args)
  regex = /(\d+)(.*)/
  args = args.first.scan(regex).first.collect(&:strip) if args.count == 1
  Unitwise::Measurement.new(*args.first.to_f, *args.last)
end
