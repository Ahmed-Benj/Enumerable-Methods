module Enumerable

  def my_each
    iterator = 0
    while iterator < self.length

      yield(self[iterator])

      iterator += 1

    end
  end

  def my_each_with_index
    iterator = 0
    while iterator < self.length

      yield(self[iterator],iterator)

      iterator += 1

    end
  end

  def my_select
    output_array = []
    self.my_each do |element|
    if yield(element)
      output_array.push(element)
    end
    end
    print output_array
  end

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

  def my_count
    i = 0
    self.my_each do |element|
      i += 1
    end
    print i
  end

  def my_map
    output_array = []
    self.my_each do |element|
    if yield(element)
      output_array.push(element)
    end
    end
  print output_array
  end

  def my_map_proc(proc_arg)
    output_array = []
    self.my_each do |element|
      output_array.push(proc_arg.call(element))
    end
    print output_array
  end

  def my_inject
    sum = self[0]
    temp = self.shift
    self.my_each do |element|
      sum = yield(sum,element)
    end
    print sum
  end

end

def multiply_els(array)
  array.my_inject do |sum, friend|
    sum = sum * friend
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
#friends_ints.my_count
#friends_strings.my_map {|friend| friend.length > 5}
#friends.my_inject {|sum, friend| sum + friend}

#12
#multiply_els(friends)

#13
proc = Proc.new do |friend| 
  if friend.length > 5 then
     friend 
  else
     print "nothing to push"
  end
end
friends_strings.my_map_proc(proc)