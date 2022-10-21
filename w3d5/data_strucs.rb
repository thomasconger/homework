class Stack
  def initialize
    @stack = []
  end

  def push(el)
    @stack << el
  end

  def pop
    @stack.pop
  end

  def peek
    @stack[-1]
  end
end

class Queue
  def initialize
    @queue = []
  end
  def enqueue(el)
    @queue.unshift(el)
  end
  def dequeue
    @queue.shift(el)
  end
  def peek
    @queue[0]
  end
end

class map
  def initialize
    @map = []
  end

  def set(key,value)
    @map << [key, value]
  end

end
