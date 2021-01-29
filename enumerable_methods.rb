#2
module Enumerable

  #3
  def my_each
    iterator = 0
    while iterator < self.length

      yield(self[iterator])

      iterator += 1

    end
  end

  #4
  def my_each_with_index
    iterator = 0
    while iterator < self.length

      yield(self[iterator],iterator)

      iterator += 1

    end
  end

  #5
  def my_select
    output_array = []
    self.my_each do |element|
    if yield(element)
      output_array.push(element)
    end
    end
    print output_array
  end

  #6
  def my_all
    output_array = []
    self.my_each do |element|
    if yield(element)
    output_array.push(element)
    end
    end
    result = output_array.length == self.length
  print result
  end
  
  #7
  def my_any 
    result = false
    self.my_each do |element|
    if yield(element)
    result = true
    print result
    exit
    end
    end
  print result
  end

  #8
  def my_none
    output_array = []
    self.my_each do |element|
    if yield(element)
    output_array.push(element)
    end
    end
    result = output_array.length == 0
  print result
  end

  #9
  def my_count
    i = 0
    self.my_each do
      i += 1
    end
    print i
  end

  #10
  def my_map
    output_array = []
    self.my_each do |element|
    if yield(element)
      output_array.push(element)
    end
    end
  print output_array
  end

  #11
  def my_inject
    sum = self[0]
    temp = self.shift
    self.my_each do |element|
      sum = yield(sum,element)
    end
    print sum
  end

  #12
  def multiply_els
    self.my_inject do |sum, friend|
      sum = sum * friend
    end
  end 

  #13
  def my_map_proc(proc_arg)
    output_array = []
    self.my_each do |element|
      output_array.push(proc_arg.call(element))
    end
    #output_array.compact
    print output_array
  end

 #14
 def my_map_proc_block(proc_arg,&block_arg)
  output_array = []

  if proc_arg
    self.my_each do |element|
      output_array.push(proc_arg.call(element))
    end

  elsif block_arg
    self.my_each do |element|
      output_array.push(block_arg.call(element))
    end
  end
  #output_array.compact
  print output_array
end

end




friends_strings = ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']

friends_ints = [3,4,5]

#friends.my_each { |friend| puts friend }
#friends.my_each_with_index { |friend, index| puts friend + index.to_s }
#friends.my_select {|friend| friend != "Brian"}
#friends_strings.my_all {|friend| friend.length > 5}
#friends_strings.my_any {|friend| friend.length == 2}
#friends_strings.my_none{|friend| friend.length > 5}
friends_ints.my_count
#friends_strings.my_map {|friend| friend.length > 5}
#friends.my_inject {|sum, friend| sum + friend}

#12
friends_ints.multiply_els

#13
  #proc = Proc.new{|friend| friend.length > 5 ? friend : nil}
  #proc = Proc.new{|friend| friend+"s"}
  #friends_strings.my_map_proc(proc)

#14
  proc = Proc.new{|friend| friend.length > 5 ? friend : nil}

  friends_strings.my_map_proc_block(proc)
  friends_strings.my_map_proc_block(proc){|friend| friend+"s"}
