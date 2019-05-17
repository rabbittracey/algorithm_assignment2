

a=[2, 20, 1, 15, 3, 11, 13, 6, 16, 10, 19, 5, 4, 9, 8, 14, 18, 17, 7, 12] 

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
  if array.length ==3
    @result = @result + 2
    return 2
  end
  select_pavat=[]
  select_pavat<<array[0]
  select_pavat<<array[-1]
  array.length%2==0 ? select_pavat<<array[array.length/2-1] : select_pavat<<array[(array.length-1)/2-1]
  pavat=select_pavat.sort[1]
  if pavat == array[0]
    #nothing need to do 
  elsif pavat == array[-1]
    array[0],array[-1] = array[-1],array[0]
  else
    if array.length%2 ==0
      array[0],array[array.length/2-1]=array[array.length/2-1],array[0]
    else
      array[0],array[(array.length-1)/2-1]=array[(array.length-1)/2-1],array[0]
    end
  end
  puts "pavat is #{pavat}"
  i=1
  
  @result = @result + array.length-1
  (1..array.length-1).each do |j| 
    if array[j] < pavat 
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
