module Eulim
  module Chemistry
    # This class is for mixture of compounds/elements
    class Substance
      attr_accessor :species
      def initialize(args)
        @species = {}
        tt_wt_p = args.inject(0) { |sum, arg| sum + arg.last }
        args.each do |specie, wt_p|
          @species.merge! specie => {
            compound: Compound.new(specie),
            weight_percent: wt_p.to_f / tt_wt_p * 100
          }
        end
      end
    end
  end
end
