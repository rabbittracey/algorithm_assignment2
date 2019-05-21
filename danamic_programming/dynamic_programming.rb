n=2000
limit = 2000000

temp=Array.new(n+1){Array.new(2,0)}
i=0
File.open('knapsack_big.txt').each do |line|
  p line.split
  if i>=1
    temp[i][0] = line.split[0].to_i
    temp[i][1] = line.split[1].to_i
  end
  i=i+1
end
temp = temp.sort {|a,b| a[1] <=> b[1]}
v=Array.new(n+1,0)
w=Array.new(n+1,0)

(1..n).each do |i|
  v[i]=temp[i][0]
  w[i]=temp[i][1]
end

a=Array.new(n+1){Array.new(limit+1,0)}

(1..n).each do |i|
  (0..limit).each do |x|
    if w[i] > x
      a[i][x] = a[i-1][x]
    else
      a[i][x] = [a[i-1][x],v[i]+a[i-1][x-w[i]]].max
    end
  end
end

