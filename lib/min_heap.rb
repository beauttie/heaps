class HeapNode
  attr_reader :key, :value

  def initialize(key, value)
    @key = key
    @value = value
  end
end

class MinHeap

  def initialize
    @store = []
  end

  # This method adds a HeapNode instance to the heap
  # Time Complexity: O(log n)
  # Space Complexity: O(1)
  def add(key, value = key)
    @store << HeapNode.new(key, value)
    heap_up(@store.length - 1)
  end

  # This method removes and returns an element from the heap
  #   maintaining the heap structure
  # Time Complexity: O(log n)
  # Space Complexity: O(1)
  def remove()
    return nil if @store.empty?

    swap(0, @store.length - 1)
    result = @store.pop
    heap_down(0)
    return result.value
  end


  # Used for Testing
  def to_s
    return "[]" if @store.empty?

    output = "["
    (@store.length - 1).times do |index|
      output += @store[index].value + ", "
    end

    output += @store.last.value + "]"
      
    return output
  end

  # This method returns true if the heap is empty
  # Time complexity: O(1)
  # Space complexity: O(1)
  def empty?
    return @store.empty?
  end

  private

  # This helper method takes an index and
  #  moves it up the heap, if it is less than it's parent node.
  #  It could be **very** helpful for the add method.
  # Time complexity: O(log n)
  # Space complexity: O(1)
  def heap_up(index)
    parent_index = (index - 1) / 2
    if index == 0
      return
    elsif @store[index].key < @store[parent_index].key
      swap(parent_index, index)
      heap_up(parent_index)
    end
  end

  # This helper method takes an index and 
  #  moves it up the heap if it's smaller
  #  than it's parent node.
  def heap_down(index)
    left_child_index = 2 * index + 1
    right_child_index = 2 * index + 2
    last_index = @store.length - 1
    if left_child_index > last_index
      return
    elsif right_child_index <= last_index && @store[right_child_index].key < @store[left_child_index].key
      if @store[right_child_index].key < @store[index].key
        swap(index, right_child_index)
        heap_down(right_child_index)
      end
    else
      if @store[left_child_index].key < @store[index].key
        swap(index, left_child_index)
        heap_down(left_child_index)
      end
    end
  end

  # If you want a swap method... you're welcome
  def swap(index_1, index_2)
    temp = @store[index_1]
    @store[index_1] = @store[index_2]
    @store[index_2] = temp
  end
end