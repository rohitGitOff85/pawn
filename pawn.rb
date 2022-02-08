class Pawn
  def self.init
    PawnSimulator.new
  end
  def self.process_comments(pawn_simulator_obj, type, options=nil)
    case type
    when 'place'
      pawn_simulator_obj.place(options[:x], options[:y], options[:f], options[:c])
    when 'move'
      no_of_step = options[:no_of_step].present? ? options[:no_of_step].to_i : 1
      pawn_simulator_obj.move(no_of_step)
    when 'left'
      pawn_simulator_obj.left
    when 'right'
      pawn_simulator_obj.right
    when 'report'
      pawn_simulator_obj.report
    end
  end
end