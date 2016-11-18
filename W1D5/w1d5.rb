#Exercise 1
class Stack
  def initialize
    @stack = []
  end

  def add(el)
    @stack << el
  end

  def remove
    @stack.pop
  end

  def show
    @stack.dup
  end
end

# stack = Stack.new
# stack.add(5)
# stack.add(1)
# stack.add(9)
# stack.remove
# p stack.show

class Queue
  def initialize
    @queue = []
  end

  def enqueue(el)
    @queue << el
  end

  def dequeue
    @queue.shift
  end

  def show
    @queue.dup
  end
end

# queue = Queue.new
# queue.enqueue(3)
# queue.enqueue(1)
# queue.enqueue(8)
# p queue.show
# queue.dequeue
# p queue.show

class Map
  def initialize
    @map = []
  end

  def assign(key, value)
    @map.each_with_index do |pair, idx|
      (@map[idx] = [key, value]; return) if pair[0] == key
    end

    @map << [key, value]
  end

  def lookup(key)
    @map.each { |pair| return pair[1] if pair[0] == key }
    nil
  end

  def remove(key)
    @map.reject! { |pair| pair[0] == key }
  end

  def show
    deep_dup(@map)
  end

  private

  def deep_dup(array)
    array.map { |pair| pair.is_a?(Array) ? deep_dup(pair) : pair }
  end
end

# mapped = Map.new
# mapped.assign("john", 2)
# mapped.assign("alice", 5)
# mapped.assign("ken", 1)
# p mapped.show
# p mapped.lookup("alice")
# mapped.remove("john")
# p mapped.show
