class PawnSimulator

  def initialize
    @place_x = 0
    @place_y = 0
    @place_f = ''
    @place_c = ''
    @first_move = true
    @first_move_y = true
    @first_move_x = true
    @rotation = 0
    @left_direction = {0 => "NORTH", 90 => "WEST", 180 => "SOUTH", 270 => "EAST"}
    @right_direction = {0 => "NORTH", 90 => "EAST", 180 => "SOUTH", 270 => "WEST"}
  end

  def place(x,y,facing,colour)
    @first_move = true
    @first_move_y = true
    @first_move_x = true

    @place_f = facing
    @place_c = colour
    @place_x = x
    @place_y = y
  end

  def move(no_of_step=1)
    return "wrong move" if (!@first_move && no_of_step > 1) || (@first_move && no_of_step > 2)

    @first_move = false
    if @first_move_y
      @place_y = @place_y + no_of_step
      @first_move_y = false
    elsif @first_move_x
      @place_x = @place_x + no_of_step
      @first_move_x = false
    else
      @first_move_y = true
      @first_move_x = true
      move(no_of_step)
    end
  end

  def left
    @rotation = @left_direction.key(@place_f.upcase)
    @rotation = @rotation+90
    if @rotation > 270
      @rotation = 0
    end
    @place_f = @left_direction[@rotation]
  end

  def right
    @rotation = @right_direction.key(@place_f.upcase)
    @rotation = @rotation+90
    if @rotation > 270
      @rotation = 0
    end
    @place_f = @right_direction[@rotation]
  end

  def report
    return @place_x, @place_y, @place_f, @place_c
  end
end