class Sketch < Processing::App

  def setup
    background 0
    smooth

    ellipse_mode CENTER
    rect_mode CENTER

    @x = @x_start = 100
    @y = @y_start = 100

    @delta = 30
    @draw_on = false
  end

  def draw
    if @draw_on
      blue_circle(mouse_x, mouse_y)
      @draw_on = false
    end
  end

  def mouse_clicked
    @draw_on = true
  end

  def blue_circle(x,y)
    fill 128,128,255
    stroke 255
    stroke_width 10
    ellipse x, y, 100, 100
  end
end

Sketch.new(:width => 800, :height => 600,
  :title => "MySketch", :full_screen => false)