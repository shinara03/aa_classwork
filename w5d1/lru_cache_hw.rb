  require "byebug"

  class LRUCache
    def initialize(size)
      @cache = []
      @max_size = size
    end

    def count
      # returns number of elements currently in cache
      @cache.count
    end

    def add(el)
      # adds element to cache according to LRU principle

      # debugger
      length_after = count + 1
      if length_after <= @max_size
        if in_cache(el)
          make_recent(el)
        else
          push(el)
        end
      else
        if in_cache(el)
          delete(@cache.first)
          make_recent(el)
        else
          delete(@cache.first)
          push(el)
        end
      end
    end

    def show
      # shows the items in the cache, with the LRU item first
      @cache
    end

    private
    # helper methods go here!
    attr_reader :cache, :max_size
    def in_cache(el)
      @cache.include?(el)
    end

    def make_recent(el)
      @cache.delete(el)
      @cache.push(el)
    end

    def delete(el)
      @cache.delete(el)
    end

    def push(el)
      @cache.push(el)
    end
  end



  johnny_cache = LRUCache.new(4)

  johnny_cache.add("I walk the line") #["I walk the line"]
  johnny_cache.add(5) # [I walk the line, 5]

  johnny_cache.count # => returns 2

  johnny_cache.add([1,2,3])  # [i walk the line, 5, [1,2,3]]
  johnny_cache.add(5) # [i walk the line , [1, 2,3], 5]
  johnny_cache.add(-5) # [i walk the line, [1,2,3], 5, -5]
  johnny_cache.add({a: 1, b: 2, c: 3}) #[[1,2,3], 5, -5,{a: 1, b: 2, c: 3} ]
  johnny_cache.add([1,2,3,4]) #[5, -5,{a: 1, b: 2, c: 3}, [1,2,3,4]]
  johnny_cache.add("I walk the line") #  [-5,{a: 1, b: 2, c: 3}, [1,2,3,4], i walk the line]
  johnny_cache.add(:ring_of_fire) #[{a: 1, b: 2, c: 3}, [1,2,3,4], i walk the line, ring_of_fire]
  johnny_cache.add("I walk the line") #[{a: 1, b: 2, c: 3}, [1,2,3,4], ring_of_fire, i walk the line,]
  johnny_cache.add({a: 1, b: 2, c: 3}) #[[1,2,3,4], ring_of_fire, i walk the line,{a: 1, b: 2, c: 3}]


  p johnny_cache.show # => prints [[1, 2, 3, 4], :ring_of_fire, "I walk the line", {:a=>1, :b=>2, :c=>3}]