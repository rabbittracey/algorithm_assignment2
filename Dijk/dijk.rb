@data=[]


File.open('dijk.txt').each do |line|
  temp = line.gsub(/\s+/m, ' ').strip.split(" ")
  @data << temp 
  # @data[i] = temp
end

@data1=Array.new(201){Array.new()}
(1..200).each do |i|
  @data[i-1][1..-1].each do |j|
  	@data1[i] << j.split(",").map { |s| s.to_i }
  end
end

x=[1]
v=[]
a=Array.new(201,2**20)
a[1]=0
(1..200).each do |i|
  v<< i
end

while x.sort != v
 #need to find the w  to minimize a[v] + l(vw)
 @min_score = 2**20
 @w_star = -1
 x.each do |i|
 	@data1[i].each do |j|
 		if !x.include?(j[0])
 			# puts a[i]
 			# puts  j[1]
 			# puts @min_score
 			if a[i]+j[1] < @min_score
 				@min_score = a[i]+j[1]
 				@w_star = j[0]
 			end
 		end
 	end
 end
 # puts @w_star
 x << @w_star if @w_star > 0
 puts x.size
end
puts a
