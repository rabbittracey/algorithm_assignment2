class UnionFind
  attr_accessor :nodes, :sizes
  def initialize(num)
    self.nodes = []
    self.sizes = []
    num.times do |n|
      self.nodes[n] = n
      self.sizes[n] = 1
    end
  end

  def root(i)
    # Loop up the chain until reaching root
    while nodes[i] != i do
      # path compression for future lookups
      nodes[i] = nodes[nodes[i]]
      i = nodes[i]
    end
    i
  end

  def union(i, j)
    rooti = root i
    rootj = root j

    # already connected
    return if rooti == rootj

    # root smaller to root of larger
    if sizes[i] < sizes[j]
      nodes[rooti] = rootj
      sizes[rootj] += sizes[rooti]
    else
      nodes[rootj] = rooti
      sizes[rooti] += sizes[rootj]
    end
  end

  def connected?(i, j)
    root(i) == root(j)
  end

end

lines_num =200000
bit_number = 24
file_name = 'data.txt'

lines = Array.new(lines_num){Array.new(2,0)}
q=0
File.open(file_name).each do |line|
  puts line.split.join
  if q>=1
    lines[q-1][0]=q-1
    lines[q-1][1] =line.split.join.to_s
  end
q=q+1
end

result = UnionFind.new(lines_num)

hash = Hash.new()
lines.each do |i|
  if hash[i[1]].nil?
    hash[i[1]] = [i[0]]
  else
	  hash[i[1]] << i[0]
    # result.union(hash[i[1]][0],i[0])
  end
end
mask = []
(0..23).each do |j|
  mask << 2**j
end
new_mask=[]
(0..23).each do |i|
  (0..23).each do |j|
    if i!=j
	    new_mask<< mask[i]+mask[j]
	  end
  end
end
new_mask=new_mask.uniq
#first round, connect the distance 0 nodes
hash.each do |key, value|
  if value.size ==2
    result.union(value[0],value[1]) 
  elsif value.size ==3 
    result.union(value[0],value[1])
    result.union(value[0],value[2]) 
    result.union(value[1],value[2]) 
  else
    count1 =count1 + 1
  end
end

#second round, connect the distance 1 nodes 

hash.each do |key,value|
  mask.each do |j|
   temp = j ^ (key.to_i(2))
   temp1=temp.to_s(2).rjust(bit_number,'0')
   if !hash[temp1].nil? 
     result.union(value[0],hash[temp1].first) unless result.connected?(value[0],hash[temp1].first)
   end
  end
end

#final step connect the distance 2 nodes

hash.each do |key,value|
  new_mask.each do |j|
   temp = j ^ (key.to_i(2))
   temp1=temp.to_s(2).rjust(bit_number,'0')
   if !hash[temp1].nil? 
     result.union(value[0],hash[temp1][0]) unless result.connected?(value[0],hash[temp1][0])
   end
  end
end












