class Stack
    def initialize
      # create ivar to store stack here!
      @ivar = []
    end

    def push(el)
      # adds an element to the stack
      @ivar << el
    end

    def pop
      # removes one element from the stack
      @ivar.pop
    end

    def peek
      # returns, but doesn't remove, the top element in the stack
      @ivar.last
    end
  end

  # stack = Stack.new 
  # p stack.push(2) # => [2]
  # p stack.push(5) # => [2, 5]
  # p stack.pop# => [5]
  # p stack.peek #=> 2

  #--------------------------------------#
  # Exercise 2 

  class Queue

    attr_reader :queue_arr

    def initialize
      @queue_arr = []
    end

    def enqueue(el)
      @queue_arr.unshift(el)
    end

  end

  q1 = Queue.new 
  p q1.queue_arr # => []
  q1.enqueue(2) 
  p q1.queue_arr # => [2]
  q1.enqueue(3) 
  p q1.queue_arr # => [3, 2]
  q1.enqueue(4) 
  p q1.queue_arr # => [4, 3, 2]