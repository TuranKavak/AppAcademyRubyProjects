class Stack
    def initialize
      # create ivar to store stack here!
        @underlying_array = []
    end

    def push(el)
      # adds an element to the stack
      underlying_array.push(el)
      el
    end

    def pop
      # removes one element from the stack
      underlying_array.pop

    end

    def peek
      # returns, but doesn't remove, the top element in the stack
      underlying_array[-1]
    end

    private

    attr_reader :underlying_array
end

class Queue

    def initialize
      # create ivar to store stack here!
        @underlying_array = []
    end

    def enqueue(el)
      underlying_array.push(el)
      el
    end

    def dequeue
      @underlying_array.shift
      el
    end

    def peek
      underlying_array[1]
    end

    private

    attr_reader :underlying_array


end

class Map

  def initialize
      # create ivar to store stack here!
        @underlying_array = []
  end

  def set(key, value)
    pair_index = underlying_array.index { |pair| pair[0] == key }
    if pair_index
      underlying_array[pair_index][1] = value
    else
      underlying_array.push([key, value])
    end
    value
  end
  
  def get(key)
    pair_index = underlying_array.index { |pair| pair[0] == key }
    underlying_array[pair_index][1]
  end

  def delete(key)
    pair_index = underlying_array.index { |pair| pair[0] == key }
    underlying_array[pair_index][1] = ''
    pair_index
  end

  def show
    deep_dup(underlying_array)
  end

  private

  attr_reader :underlying_array

  def deep_dup(arr)
    arr.map { |el| el.is_a?(Array) ? deep_dup(el) : el }
  end  

end