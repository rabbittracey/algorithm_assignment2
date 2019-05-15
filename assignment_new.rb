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
file_name = 'data.txt'
lines = Array.new(lines_num){Array.new(2,0)}
i=0
File.open(file_name).each do |line|
  puts line.split.join
  if i>=1
    lines[i-1][0]=i-1
    lines[i-1][1] =line.split.join.to_i(2)
  end
i=i+1
end
hash = Hash.new()
lines.each do |i|
  if hash[i[1]].nil?
    hash[i[1]] = [i[0]]
  else
	hash[i[1]] << i[0]
  end
end
mask=[]
(0..23).each do |i| 
	mask<<2**i
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
final_mask=mask+new_mask
hash = hash.sort.to_h
final_mask = final_mask.sort

result = UnionFind.new(lines_num)

hash.each do |key,value|
  if hash[key].size > 1 
    hash[key].each do |i| 
      hash[key].each do |j|
        result.union(i,j) 
      end
    end
  end
  final_mask.each do |i|
    if !hash[key+i].nil? 
      if result.connected?(hash[key][0], hash[key+i][0])
        puts 'already connected'
      else
        hash[key].each do |m|
          hash[key+i].each do |n| 
            result.union(m,n)
          end
        end
      end
    end
    if !hash[key-i].nil? 
      if result.connected?(hash[key][0], hash[key-i][0])
        puts 'already connected'
      else
        hash[key].each do |m|
          hash[key-i].each do |n| 
            result.union(m,n)
          end
        end
      end
    end
  end
end











