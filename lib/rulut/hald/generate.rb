module Rulut
  module Hald
    class Generate
      include Magick
      attr_accessor :levels

      def initialize(levels = 3)
        @levels = levels
        @cube_size = levels **3
        @colors_array = []
      end

      def call
        canvas = Image.new(@cube_size, @cube_size) do |c|
          c.background_color = "Transparent"
          c.format = 'png'
        end
        levels_square = levels ** 2
        color_step = 255.0/ (levels_square- 1)
        (0...levels_square).each do |b|
          (0...levels_square).each do |g|
            (0...levels_square).each do |r|
              red = (r * color_step).round
              green = (g * color_step).round
              blue = (b * color_step).round
              @colors_array << rgb_to_color(red, green, blue)
            end
          end
        end
        @colors_array.each_with_index do |color, idx|
          y = idx / @cube_size
          x = idx % @cube_size
          puts "idx #{idx} x #{x} y #{y}"
          canvas.pixel_color(x, y, color)
        end
        canvas.write(File.join(SPEC_TMP_PATH, 'test.png'))
      end

      def rgb_to_color(r,g,b)
        sprintf("#%02x%02x%02x", r, g, b).upcase
      end
    end
  end
end
