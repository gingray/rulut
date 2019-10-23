module Rulut
  module Hald
    class Generate
      include Magick
      attr_accessor :levels

      def initialize(levels = 3)
        @levels = levels
        @cell_width = levels ** 2
        @cell_height = levels
      end

      def call
        canvas = Image.new(9, 3) do |c|
          c.background_color = "Transparent"
          c.format = 'png'
        end
        step1 = 255.0 / @cell_width
        step2 = 255.0 / @cell_height
        (0..@cell_width).each do |x|
          (0..@cell_height).each do |y|
            r = (x * step1).to_i
            g = (y * step2).to_i
            color =  sprintf("#%02x%02x%02x", r, g, 0).upcase
            canvas.pixel_color(x, y, color)
          end
        end
        canvas.write(File.join(SPEC_TMP_PATH, 'test.png'))
      end
    end
  end
end
