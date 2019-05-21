
#prepare data
@data=Hash.new()
i=0
File.open('cut.txt').each do |line|
  temp = line.split().map{|a| a.to_i}
  key = temp[0]
  value = tempxa[1..-1]
  @data[key] = value
  i=i+1
end
@result = 2^20
repeat = 1000
(1..repeat).each do |j|
  @a=Array.new()
  @data.each do |key,value|
    value.each do |v|
      if key < v
        @a<<[key,v]
      end
    end
  end

  while @a.uniq.size > 1
    temp,temp1 = @a.sample
    @a.each do |i|
      i[0] = temp if i[0] == temp1
      i[1] = temp if i[1] ==temp1
      i[0],i[1]=i[1],i[0] if i[0] > i[1]
    end
    
    @a.delete_if{|i| i[0]==i[1]}
  end
  @result =[@a.size,@result].min
  # puts @result
  puts "#{j} th time" if j%10 ==0
end
puts @result 





