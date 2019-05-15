length = 10
w = Array.new(length+1,0)
i=0
File.open('mwis1.txt').each do |line|
  if i>=1
    w[i]=line.to_i
  end
i=i+1
end

a=Array.new(length+1,0)
a[0]=0
a[1]=w[1]

(2..length).each do |i| 
  a[i] = [a[i-2]+w[i],a[i-1]].max  
end

result = Array.new(length+1,0)


i=length
while i>=2
  if a[i-2] +w[i] >= a[i-1]
    result[i]=1
    i=i-2
  else
  	i=i-1
  end
  
end
result[1] =1 if w[1] >=w[2]





b=[1, 2, 3, 4, 17, 117, 517, 997]
b.each do |i|
  p result[i]
end