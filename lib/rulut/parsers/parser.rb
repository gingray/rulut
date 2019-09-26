module Rulut
  class Parser
    Treetop.load(File.expand_path('../cube.treetop', __FILE__))
    @cube_parser = CubeGrammarParser.new

    def self.parse_cube(data)
      tree = @cube_parser.parse data
      raise "Parser error at offset: #{@cube_parser.index} failure reason: #{@cube_parser.failure_reason}" unless tree

      tree
    end
  end
end
