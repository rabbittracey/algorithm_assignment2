lines = Array.new(200000){Array.new(2,0)}
i=0
File.open('data.txt').each do |line|
  puts line.split.join
  if i>=1
    lines[i-1][0]=i
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

result = Array.new()
hash.each do |key,value|
  result << value
end
hash.each do |key,value|
  final_mask.each do |i| 
    if !hash[key+i].nil? 
	  temp1 = result.select{|a| a.include?(hash[key][0])}
	  temp2 = result.select{|a| a.include?(hash[key+i][0])}
	  if temp1[0][0] != temp2[0][0]   	
	  	temp3=temp1[0]+temp2[0]
	  	result << temp3
	  	result = result -temp1-temp2
	  	puts result.size
	  end
    end
  end
end
result.size
