module Arel
  module Nodes
    class Unary < Arel::Nodes::Node
      attr_accessor :expr
      alias :value :expr

      def initialize expr
        @expr = expr
      end
    end

    %w{
      Group
      Grouping
      Having
      Limit
      Not
      Offset
      On
      Top
    }.each do |name|
      const_set(name, Class.new(Unary))
    end
  end
end
