class Sketch < Processing::App
  def new(params)
    @width = params[:width]
    @height = params[:height]
    super
  end

  def setup
    @background = 0
    background @background
    smooth

    # Set ellipses and rects to CENTER mode
    ellipse_mode CENTER
    rect_mode CENTER

    buffer_x = 10
    buffer_y = 10
    ratio = 8 #64/20
    @diameter = 72 #208
    @overlap = @diameter/ratio
    @y_step = @diameter-@overlap
    @x_start = @diameter/2 + buffer_x
    @y_start = @diameter/2 + buffer_y
    @x = @x_start
    @y = @y_start

    @color_set = [[0,113,188],
                  [0,173,239],
                  [68,199,244],
                  [157,220,249],
                  [255,235,149],
                  [0,113,188],
                  [0,173,239],
                  [68,199,244],
                  [157,220,249]
            ]

    @transparency = 210


    # Loop Control
    @rows = @height / (@diameter - @overlap) - 1
    @columns = @width / (@diameter - @overlap) - 1

    @frame_counter = 0
  end

  def draw
    if @frame_counter < (@rows * @columns)
      color = @color_set[rand(@color_set.size)]

      @transparency = rand(128) + 128


      fill color[0], color[1], color[2], @transparency

      stroke color[0], color[1], color[2], 0
      ellipse @x, @y, @diameter, @diameter
      @x = @x + @diameter - @overlap
      @frame_counter += 1

      if @frame_counter % @columns == 0
        @y += @y_step
        @x = @x_start
      end
    end

  end

  def mouse_clicked
    @frame_counter = 0
    @y = @y_start
    @x = @x_start
    background @background
  end

  def key_pressed
    if key == "s"
      saveFrame "frame###.jpg"
    end
  end
end

Sketch.new(:width => 1024, :height => 768, :title => "MySketch", :full_screen => false)