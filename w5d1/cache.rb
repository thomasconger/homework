class LRUCache

  attr_reader :max_size

  def initialize(max_size=4)
    @underlying_array = []
    @max_size = max_size
  end

  def count
    @underlying_array.count
  end

  def add(el)
    if count == max_size && !@underlying_array.include?(el)
      @underlying_array.shift
      @underlying_array.push(el)
    elsif count == max_size && @underlying_array.include?(el)
      idx = @underlying_array.index(el)
      @underlying_array.delete_at(idx)
      @underlying_array.push(el)
    else
      @underlying_array.push(el)
    end
  end

  def show
    @underlying_array
  end

  private
  # helper methods go here!

end
