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

  # stack = Stack.new # => []
  # p stack.push(2) # => [2]
  # p stack.push(5) # => [2, 5]
  # p stack.pop# => [5]
  # p stack # => [2]
  # p stack.peek #=> 2