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
    @d = @d_start = 10
  end

  def draw
    if @draw_on
      my_circle(mouse_x, mouse_y, @d)
    end
  end

  def random_color
    @color_set[rand(@color_set.size)]
  end

  def random_transparency
    rand(128) + 128
  end

  def key_pressed
    case key
      when "c" then
        background 0
      when "s" then
        saveFrame "my_sketch_frame_###.jpg"
      when "q" then
        exit
    end
  end

  def mouse_pressed
    @draw_on = true
  end

  def mouse_released
    @draw_on = false
    @d = @d_start
  end

  def mouse_dragged
    @d += 1
  end

  def my_circle(x,y,d)
    color = random_color
    fill color[0], color[1], color[2], random_transparency
    stroke 255, random_transparency
    stroke_width 10
    ellipse x, y, d, d
  end
end

Sketch.new(:width => 800, :height => 600,
  :title => "MySketch", :full_screen => false)