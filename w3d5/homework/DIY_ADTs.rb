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

    def dequeue
      @queue_arr.pop
    end

    def peek 
      @queue_arr.last
    end
  end

  # q1 = Queue.new 
  # p q1.queue_arr # => []
  # q1.enqueue(2) 
  # p q1.queue_arr # => [2]
  # q1.enqueue(3) 
  # p q1.queue_arr # => [3, 2]
  # q1.enqueue(4) 
  # p q1.queue_arr # => [4, 3, 2]
  # p q1.dequeue  # => 2
  # p q1.peek # => 3
  # p q1.queue_arr # => [4, 3]
  # p q1.dequeue # => 3
  # p q1.peek # => 4

  #--------------------------------------#
  # Exercise 3
  class Map
    
    attr_reader :map_arr

    def initialize
      @map_arr = []
    end

    def set(key, val)
      new = true
      @map_arr.each_with_index do |subArr, idx|
        if subArr[0] == key
          subArr[1] = val
          new = false
        end
      end
      if new
        new_pair = [key, val]
        @map_arr << new_pair
      end
    end

    def get(key)
      @map_arr.each {|subArr| return subArr[1] if subArr[0] == key}
      nil
    end

    def delete(key)
      delete_idx = @map_arr.index {|subArr| subArr[0] == key}
      if delete_idx != nil
        @map_arr.delete_at(delete_idx)
      else
        return nil
      end
    end

    def show
      @map_arr
    end
  end

  # m1 = Map.new
  # p m1.set("a", 1) 
  # p m1.set("b", 2)
  # p m1.set("c", 3)
  # p m1.set("c", 4)
  # p m1.show
  # p m1.get("c")
  # p m1.get("a")
  # p m1.get("f")
  # p m1.delete("c")
  # p m1.show
  # p m1.delete("a")
  # p m1.show
  # p m1.delete("f")
  # p m1.show