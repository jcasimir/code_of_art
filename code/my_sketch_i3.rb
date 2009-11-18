class Sketch < Processing::App

  def setup
    background 0
    smooth

    ellipse_mode CENTER
    rect_mode CENTER

    @draw_on = false

    @color_set = [[0,113,188],
                  [0,173,239],
                  [68,199,244],
                  [157,220,249],
                  [255,235,149],
                 ]
  end

  def draw
    if @draw_on
      d = rand(100) + 100
      my_circle(mouse_x, mouse_y, d)
      @draw_on = false
    end
  end

  def random_color
    @color_set[rand(@color_set.size)]
  end

  def mouse_pressed
    @draw_on = true
  end

  def my_circle(x,y,d)
    color = random_color
    fill *color
    stroke 255
    stroke_width 10
    ellipse x, y, d, d
  end
end

Sketch.new(:width => 800, :height => 600,
  :title => "MySketch", :full_screen => false)