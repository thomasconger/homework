class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14) {Array.new(4, :stone)}
    @cups[6] = Array.new()
    @cups[13] = Array.new()
    self.place_stones

  end

  def place_stones

  end

  def valid_move?(start_pos)
    if @cups[start_pos].nil?
      raise 'Invalid starting cup'
    elsif @cups[start_pos].empty?
      raise 'Starting cup is empty'
    end
  end

  def make_move(start_pos, current_player_name)

    hand = @cups[start_pos]
    @cups[start_pos] = []

    cup_idx = start_pos + 1
    until hand.empty?
      cup_idx = 0 if cup_idx == 14
      if cup_idx == 6
        @cups[cup_idx] << hand.pop if current_player_name == @name1
        cup_idx += 1
      elsif cup_idx == 13
        @cups[cup_idx] << hand.pop if current_player_name == @name2
        cup_idx += 1
      else
        @cups[cup_idx] << hand.pop
        cup_idx += 1
      end
    end

    render
    next_turn(cup_idx)


  end

  def next_turn(ending_cup_idx)
    # # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
    if ending_cup_idx == 6 || ending_cup_idx == 13
      :prompt
    elsif @cups[ending_cup_idx].count == 1
      :switch
    else
      ending_cup_idx
    end
    # if ending_cup_idx == 6 || ending_cup_idx == 13
    #   # ended on store -- get to choose where to start again
    #   :prompt
    # elsif @cups[ending_cup_idx].count == 1
    #   # ended on empty cup -- switches players' turns
    #   :switch
    # else
    #   # ended on cup with stones in it -- automatically starts there
    #   ending_cup_idx
    # end

  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    return true if @cups[0..5].all? do |cup|
      cup.length == 0
    end
    return true if @cups[7..12].all? do |cup|
      cup.length == 0
    end
    return false
  end

  def winner
    outcome = (@cups[6] <=> @cups[13])
    if outcome == 0
      :draw
    elsif outcome == 1
      @name1
    else
      @name2
    end
  end
end
