lines = Array.new(1000,0)
i=0
sum=0
File.open('huffman.txt').each do |line|
  if i>=1
    lines[i-1] =line.to_i
    sum =sum+line.to_i
  end
  i=i+1
end
lines=lines.sort



class Node
  attr_accessor :data, :frequency, :left, :right
  def initialize(data,frequency)
    @data = data
    @frequency = frequency
    @left = nil
    @right = nil
  end
end

class MinHeap
  attr_accessor :array

  def initialize(capacity)
    @array = []
  end

  def insert(node)
    i = array.count
    while i > 0 && array[(i-1)/2].frequency > node.frequency do
      array[i] = array[(i-1)/2]
      i = (i -1)/2
    end 
    array[i] = node
  end

  def delete
    val = array[0]
    array[0] = array[-1]
    array.pop
    percolate_down(0) if array.count != 0
    return val
  end

  def percolate_down(index)
    val = array[index].frequency
    left_c = left_child(index)
    right_c = right_child(index)
    if 	left_c != -1 && left_c.frequency < val
      min = 2*index+1
    else
      min = index
    end

    if right_c != -1 && array[min].frequency > right_c.frequency
      min = 2*index + 2
    end

    if min != index
      temp = array[index]
      array[index] = array[min]
      array[min] = temp
      percolate_down(min)
    else
      return
    end
  end

  def left_child(index)
    array[2*index+1].nil? ? -1 : array[2*index+1]
  end

  def right_child(index)
    array[2*index+2].nil? ? -1 : array[2*index+2]
  end

end
