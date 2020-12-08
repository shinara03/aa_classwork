require "byebug" 

class Board
  attr_accessor :cups


  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = []
    place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
     14.times do |i|
      if i == 6 || i == 13
         @cups << []
      else
        @cups << [:stone] * 4
      end
    end
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" if start_pos < 0 || start_pos > 12
    raise "Starting cup is empty" if @cups[start_pos].empty?
  end

  def make_move(start_pos, current_player_name)
    stones = @cups[start_pos]
    @cups[start_pos] = []

    curr_pos = start_pos
    until stones.length == 0
      # debugger
      curr_pos = curr_pos + 1
      curr_pos = 0 if curr_pos > 13

      if current_player_name == @name1
        @cups[curr_pos] << stones.pop if curr_pos != 13
      else
        @cups[curr_pos] << stones.pop if curr_pos != 6
      end
    end

    render
    next_turn(curr_pos)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
    if ending_cup_idx == 6 || ending_cup_idx == 13
      return :prompt
    elsif @cups[ending_cup_idx].length == 1
      return :switch
    else
      return ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    side1 = @cups[0..5].all? {|cup| cup.empty?}
    side2 = @cups[6..12].all? {|cup| cup.empty?}
    
    side1 || side2
  end

  def winner
    
  end
end
