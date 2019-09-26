module Rulut
  class Parser
    module CubeGrammar

      class ::Treetop::Runtime::SyntaxNode
        def to_object(val = nil)
          val ||= Cube.new

          elements&.each { |item| item.to_object(val) }
          val
        end
      end

      class Title < ::Treetop::Runtime::SyntaxNode
        def to_object(val = nil)
          val ||= Cube.new
          val.title = text_value
          val
        end
      end

      class CubeLine < ::Treetop::Runtime::SyntaxNode
        def to_object(val = nil)
          val ||= Cube.new
          val.lines << text_value.split(' ').map(&:to_f)
          val
        end

      end

      class ColorValue < ::Treetop::Runtime::SyntaxNode

      end

      class Comment < ::Treetop::Runtime::SyntaxNode
        def to_object(val = nil)
          val ||= Cube.new
          val.comments << text_value
          val
        end
      end
    end
  end
end
