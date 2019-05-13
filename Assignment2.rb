require 'csv'
a=Array.new(10){Array.new(3,0)}
i=0
CSV.foreach("data1.csv") do |row|
  a[i][0]=row[0].to_i
  a[i][1]=row[1].to_i
  a[i][2]=row[2].to_i
  i=i+1
end
a=a.sort{|a,b|a[2]<=>b[2]}

v_number= a.size
k=2
node_number = 5 
loop_number = node_number-k

# starft from node_number clusters 
clusters = Array.new
(1..node_number).each do |i|
	clusters << [i]
end

# list.sort{|a,b|a[2]<=>b[2]}
#  => [[1, 2, 1], [3, 4, 1], [1, 3, 2], [2, 4, 3], [2, 3, 4], [1, 4, 4], [1, 5, 5], [2, 5, 6], [3, 5, 7], [4, 5, 8]]


 a.each do |i|
    
 	temp1 = clusters.select{|a| a.include?(i[0])}
 	temp2 = clusters.select{|a| a.include?(i[1])}
 	if temp1 == temp2 #in same cluster
 		puts "they are in the same cluster"
    else #not in the same cluster
    	if clusters.size == k 
    		break i
    	end
    	temp3 = temp1[0] + temp2[0]
        clusters << temp3
        clusters = clusters-temp1-temp2
 	end
 end




# operation 1: combine two cluster, each cluster is an array of nodes

# def combine a, b 
# 	return a+b
# end

# operation 2: calculate the distance between two cluster , each cluster is an arry containing the nodes in that cluster 

def distance a, b 
	a_size= a.size
	b_size=b.size
	min = 2**30
	(0..a_size-1).each do |i| 
		(0..b_size-1).each do |j|
		    temp= @list.select{|(x, y)| (x == a[i]&&y==b[j])|| (y == a[i]&&x==b[j])}
		    if !temp[0].nil? && temp[0][2] < min 
		      min = temp[0][2]
		    end
		end	
	end
	return min 
end

a.select{|(x, y)| x == 1}