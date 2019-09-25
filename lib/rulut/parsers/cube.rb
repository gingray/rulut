module Rulut
  module Parser
    class Cube
      Treetop.load(File.expand_path('../cube.treetop', __FILE__))
      @parser = CubeGrammarParser.new

      def self.parse data
        tree = @parser.parse data
        raise "Parser error at offset: #{@parser.index} failure reason: #{@parser.failure_reason}" unless tree

        tree
      end
    end
  end
end



