#read the data
@data=Array.new(){Array.new(2,0)}
node_number = 875714
i=0
File.open('data.txt').each do |line|
  temp = line.split().map{|a| a.to_i}
  @data[i] = temp if temp[0] !=temp[1]
  # @data[i] = temp
  i=i+1
end




@node_explore = Array.new(node_number,0)
@node_leader = Array.new(node_number,0)
@node_f=Array.new()
(1..node_number).each do |i| 
  @node_f << [i-1,0]
end
#DFS Loop
@t = 0
@s = -1


def DFS(data,i)
  @node_explore[i] =1
  @node_leader[i] = @s
  #loop
  i_loop = data.select{|a| a[0] == i}
  puts i_loop
  i_loop.each do |k|
    if @node_explore[k[1]]==0
      DFS(@data,k[i])
    end
  end
  @t=@t+1
  puts @t
  @node_f[i][1]=@t
end

#first loop



(0..node_number-1).each do |i|
  j=@data.length-1-i
  if @node_explore[j] == 0
    # @s=i
    DFS(@data,j)

  end
  # puts i
end



#second loop

@node_f_final=@node_f
@node_f_final.sort {|a,b| a[1] <=> b[1]}.reverse

@node_f_final.each do |i|
  if @node_explore[i[0]] == 0
    @s=i[0]
    DFS(@data,i[0])
  end
end
puts @s.uniq




















