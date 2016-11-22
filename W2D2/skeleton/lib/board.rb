class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14) { Array.new }
    place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    @cups.each_with_index do |cup, idx|
      next if idx == 6 || idx == 13
      4.times { cup << :stone }
    end
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" unless start_pos.between?(0, 12)
    raise "Invalid starting cup" if cups[start_pos].empty?
  end

  def make_move(start_pos, current_player_name)
    stones = cups[start_pos]
    self.cups[start_pos] = []
    idx = start_pos
    until stones.empty?
      idx += 1
      idx = 0 if idx == 14
      if idx == 6
        cups[idx] << stones.shift if current_player_name == @name1
      elsif idx == 13
        cups[idx] << stones.shift if current_player_name == @name2
      else
        cups[idx] << stones.shift
      end
    end

    render
    next_turn(idx)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine what #make_move returns
    if ending_cup_idx == 6 || ending_cup_idx == 13
      :prompt
    elsif cups[ending_cup_idx].length == 1
      :switch
    else
      ending_cup_idx
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
    (0..5).all? { |i| cups[i].empty? } || (7..12).all? { |i| cups[i].empty? }
  end

  def winner
    if cups[6].length == cups[13].length
      :draw
    elsif cups[6].length < cups[13].length
      @name2
    else
      @name1
    end
  end
end
