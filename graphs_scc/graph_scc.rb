
#read the data
@data=[]
# node_number = 875714
node_number =9

File.open('data1.txt').each do |line|
  temp = line.split().map{|a| a.to_i}
  @data << temp if temp[0] !=temp[1]
  # @data[i] = temp
end
@node_explore = Hash.new()
@node_leader = Hash.new()
(1..node_number).each do |i|
  @node_explore[i] =0
  @node_leader[i] =-1
end
@node_f=Array.new()
(1..node_number).each do |i| 
  @node_f << [i,0]
end
#DFS Loop
@t = 0
@s = -1


def DFS(data,i)
  puts i
  @node_explore[i] =1
  @node_leader[i] = @s
  #loop
  i_loop = @data.select{|a| a[0] == i}
  i_loop.each do |k|
    if @node_explore[k[1]]==0
      DFS(@data,k[1])
    end
  end
  @t=@t+1
  p i
  p @node_f[i]
  @node_f[i-1][1]=@t
end

def DFS1(data,i)
  puts "second round #{i}"
  @node_explore[i] =1
  @node_leader[i] = @s
  #loop
  i_loop = @data.select{|a| a[0] == i}
  i_loop.each do |k|
    if @node_explore[k[1]]==0
      DFS1(@data,k[1])
    end
  end
end

#first loop

r=[]
(1..node_number).each do |i|
  r << node_number-i+1
end

r.each do |i|
  puts "this is for #{i}"
  if @node_explore[i] == 0
    DFS(@data,i)
  end
end





#second loop
@node_explore.each do |key,value|
  value = 0
end
@node_f_final=@node_f.sort {|a,b| a[1] <=> b[1]}.reverse

@node_f_final.each do |i|
  
  if @node_explore[i] == 0
    @s=i
    DFS1(@data,i)
  end
end





















