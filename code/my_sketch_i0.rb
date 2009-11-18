class Sketch < Processing::App

  def setup
    background 0
    smooth

    ellipse_mode CENTER
    rect_mode CENTER

  end

  def draw
    fill 128,128,255
    stroke 255
    stroke_width 10
    ellipse 400, 300, 100, 100
  end
end

Sketch.new(:width => 800, :height => 600,
  :title => "MySketch", :full_screen => false)