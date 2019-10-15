module Rulut
  class Color
    RGB_MAX = 255.0
    class << self
      def rgb_to_hsl(r,g,b)
        red = r / RGB_MAX
        green = g / RGB_MAX
        blue = b / RGB_MAX
        min = [red, green, blue].min
        max = [red, green, blue].max
        luminance = (min + max) / 2
        saturation = 0
        if max != min
          saturation = (max - min) / (2.0 - max - min) if luminance > 0.5
          saturation = (max - min) / (max + min) if luminance < 0.5
        end
        hue = 0
        hue = (green - blue) / (max - min) if red == max
        hue = 2.0 + (blue - red) / (max - min) if green == max
        hue = 4.0 + (red -  green) / (max - min) if blue == max
        hue *= 60
        hue += 360.0 if hue.negative?
        [hue.round, (saturation * 100).round , (luminance * 100).round]
      end
    end
  end
end
