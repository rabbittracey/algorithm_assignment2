
#prepare data
@data=Hash.new()
i=0
File.open('cut.txt').each do |line|
  temp = line.split().map{|a| a.to_i}
  key = temp[0]
  value = temp[1..-1]
  @data[key] = value
  i=i+1
end

@result = 0
total_time=5000
experiment_times=1000
@final_result=0
(1..experiment_times).each do |k|
  (1..total_time).each do |j|
    data =@data
    while data.size>2
      pick_data = data.map{|a| a[0]}.sample
      pick_data1 = data[pick_data].sample 
      if !data[pick_data1].nil? && pick_data != pick_data1
        
        #we want to combine pick_data and pick_data1 to pick_data
        
        data[pick_data] = data[pick_data]+data[pick_data1]
        data[pick_data].delete_if{|a| a==pick_data}
        data[pick_data].delete_if{|a| a==pick_data1}
        data.delete(pick_data1)
        # puts "delete #{pick_data1}"

        data.each do |key,value|
          data[key].delete_if{|a| a==key}
          if key!= pick_data && value.include?(pick_data1)
            (0..value.length-1).each do |i|
              value[i] = pick_data if value[i] == pick_data1
            end
          end
        end

        
      
      end
      # puts data.size
    end
    final=data.map{|key,value| key}
    @result = @result+ data[final[0]].size
    puts "this is weird" if data[final[0]].size != data[final[1]].size
    # puts "this is the #{j} the time and result = #{result}" if j%50 ==0
  end
  puts @final_result
  @final_result=@final_result + @result/total_time
  puts "this is the #{k} times"
  @result = 0
end
@final_result=@final_result/experiment_times
puts @final_result


