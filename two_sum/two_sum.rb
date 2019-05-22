@data=Hash.new()


File.open('data.txt').each do |line|
  temp = line.to_i
  @data[temp] = 1
  # @data[i] = temp
end
@result = 0
(-10000..10000).each do |t|
  @data.each do |key,value|
    if !@data[t-key].nil? && t-key != key 
      @result = @result + 1
      break
    end
  end
  p t 
end
puts @result
