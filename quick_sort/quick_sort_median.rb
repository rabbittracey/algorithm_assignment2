a=[]
File.open('data.txt').each do |line|
  a<<line.to_i
end

# when there is a recursive call on a subarray of length mm, you should simply add m-1m−1 to your running total of 
@result = 0

def Pivat(array)
  puts "array before is #{array}" 
  if array.length <=1 
    return 0
  end
  if array.length ==2
    @result = @result + 1
    if array[0] > array[1]
      array[0],array[1] = array[1],array[0]
    end
    return 1
  end
  # if array.length ==3
  #   @result = @result + 2
  #   return 2
  # end
  
  
  l = array.length
  l.even? ? middle = l/2-1 : middle = l/2
  
  #case 1 array[-1] is the median 
  if (array[-1]>array[0] && array[-1] < array[middle]) || (array[-1]<array[0] && array[-1] > array[middle])
      array[0],array[-1] = array[-1],array[0]
  end

  #case 2 middle is the median 

  if (array[middle]>array[0] && array[middle] < array[-1]) || (array[middle]<array[0] && array[middle] > array[-1])
      array[0],array[middle] = array[middle],array[0]
  end
  pivat = array[0]
  puts "pavat is #{pivat}"
  i=1
  
  @result = @result + array.length-1
  (1..array.length-1).each do |j| 
    if array[j] < pivat 
      array[i],array[j]=array[j],array[i]
      i=i+1
    end
  end
  if i==1 
    puts "the array after is #{array}"
    Pivat(array[1..-1])
  else
    array[0],array[i-1]=array[i-1],array[0]
    puts "the array after is #{array}"
    Pivat(array[0..i-2])
    Pivat(array[i..-1])
  end
end
puts a
Pivat(a)
puts @result
