require 'ruby-processing'

class ManipulateVideoImageSketch < Processing::App

  load_library "video"
  import "processing.video" 

  def setup
    @video = Capture.new(self, width, height, 30)
    @pointillize = 10
    @block_size = 5
    frame_rate 200 # Let's run this one as fast as we can.
    no_stroke
    smooth
    @horizontal = (width/@block_size)
    @vertical = (height/@block_size)
  end

  def draw
    @video.read if @video.available

    # A video image can also be tinted and resized just as with a PImage.
    image @video, 0, 0, width, height
    
    background 255
    @vertical.times do |j|
      @horizontal.times do |i|
        draw_point(i * @block_size, j * @block_size, @block_size)
      end
    end
  end
  
  def draw_point(x,y,d)
    loc = x + y * width

    # Look up the RGB color in the source image
    load_pixels
    pixel = @video.pixels[loc]
    r, g, b = red(pixel), green(pixel), blue(pixel)
    
    # Draw an ellipse at that location with that color
    fill r, g, b, 255
    # Back to shapes! Instead of setting a pixel, we use the color from a pixel to draw a circle.
    #ellipse x, y, d, d
    rect x,y,d,d
  end

end

ManipulateVideoImageSketch.new :title => "Manipulate Video Image", :width => 160, :height => 120
