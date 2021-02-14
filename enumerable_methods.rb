# 2
module Enumerable
  # 3
  def my_each
    if block_given?
      iterator = 0
      while iterator < length
        yield(self[iterator])
        iterator += 1
      end
    else
      to_enum(__method__)
    end
  end

  # 4
  def my_each_with_index
    if block_given?
      iterator = 0
      while iterator < length
        yield(self[iterator], iterator)
        iterator += 1
      end
    else
      to_enum(__method__)
    end
  end

  # 5
  def my_select
    if block_given?
      output_array = []
      my_each do |element|
        output_array.push(element) if yield(element)
      end
      print output_array
    else
      to_enum(__method__)
    end
  end

  # 6
  def my_all(pattern = nil)
    output_array = []
    if pattern
      my_each do |element|
        output_array.push(element) if pattern === element
      end
    elsif block_given?
      my_each do |element|
        output_array.push(element) if yield(element)
      end
    elsif !block_given?
      my_each do |obj|
        output_array.push(obj) if obj != false and obj != nil
      end
    end
    result = output_array.length == length
    print result
  end

  # 7
  def my_any(pattern = nil)
    result = false
    if pattern
      my_each do |element|
        if pattern === element
          result = true
        end
      end
    elsif block_given?
      my_each do |element|
        if yield(element)
          result = true         
        end
      end
    elsif !block_given?
      my_each do |obj|
        if obj
          result = true
        end
      end
    end
    print result
  end

  # 8
  def my_none(pattern = nil)
    output_array = []
    if pattern
      my_each do |element|
        output_array.push(element) if pattern === element
      end
    elsif block_given?
      my_each do |element|
        output_array.push(element) if yield(element)
      end
    elsif !block_given?
      my_each do |obj|
        output_array.push(obj) if obj != false and obj != nil
      end
    end
    result = output_array.length.zero?
    print result
  end

  # 9
  def my_count(arg = nil)
    iterator = 0
    output = 0
    if (arg)
      my_each do |element|
        output += 1 if arg == element
      end
    elsif block_given?
      my_each do |element|
        output += 1 if yield(element)
      end
    elsif !block_given?
      my_each do |element|
        output += 1
      end
    end
    print output
  end

  # 10
  def my_map
    arr = nil
    array_type = lambda do |input_type|
      arr = self.to_a
    end
    array_type.call(self.class)

    output_array = []
    if block_given?
      arr.my_each do |element|
        output_array.push(yield(element))
      end
    else
      to_enum(__method__)
    end
    print output_array
  end

  # 11
  def my_inject(*args)
    arr = self.to_a
    if block_given?
      if (args.length == 1)
        result = args[0]
        result = yield(result, arr[0])
        temp = arr.drop(1)
        temp.my_each do |element|
          result = yield(result, element)
        end
      else
        result = arr[0]
        temp = arr.drop(1)
        temp.my_each do |element|
          result = yield(result, element)
        end
      end
    elsif !block_given?
      if (args.length == 1)
          acc = args[0]
          result = arr[0]
          temp = arr.drop(1)
          temp.my_each do |element|
            result = result.send(acc,element)
          end
      elsif (args.length == 2)
        result = args[0]
        acc = args[1]
        arr.my_each do |element|
          result = result.send(acc,element)
        end
      end
    end
    print result
  end

  # 12
  def multiply_els
    my_inject do |sum, friend|
      sum * friend
    end
  end

  # 13
  def my_map_proc(proc_arg)
    output_array = []
    my_each do |element|
      output_array.push(proc_arg.call(element))
    end
    # output_array.compact
    print output_array
  end

  # 14
  def my_map_proc_block(proc_arg = nil, &block_arg)
    output_array = []

    if proc_arg
      my_each do |element|
        output_array.push(proc_arg.call(element))
      end

    elsif block_arg
      my_each do |element|
        output_array.push(block_arg.call(element))
      end
    end
    # output_array.compact
    print output_array
  end
end

# input section

 friends = %w[Sharon Leo Leila Brian Arun]

 friends_strings = %w[Sharon Leo Leila Brian Arun]

 friends_ints = [3, 4, 5]

# 3
# friends.my_each { |friend| puts friend }

# 4
# friends.my_each_with_index { |friend, index| puts friend + index.to_s }
# hash = Hash.new
# %w(cat dog wombat).my_each_with_index { |item, index| hash[item] = index }
# p hash

# 5
# friends.my_select {|friend| friend != "Brian"}
# [1,2,3,4,5].my_select { |num|  num.even?  }

# 6
# puts friends_strings.my_all {|friend| friend.length > 5}
# puts %w[ant bear cat].my_all { |word| word.length >= 3 }
# puts %w[ant bear cat].my_all { |word| word.length >= 4 }
# puts %w[ant bear cat].my_all(/t/)
# puts [1, 2i, 3.14].my_all(Numeric)
# puts [nil, true, 99].my_all
# puts [].my_all

# 7
# puts friends_strings.my_any {|friend| friend.length == 3}
# puts %w[ant bear cat].my_any { |word| word.length >= 3 } #=> true
# puts %w[ant bear cat].my_any { |word| word.length >= 4 } #=> true
# puts %w[ant bear cat].my_any(/d/)                        #=> false
# puts [nil, true, 99].my_any(Integer)                     #=> true
# puts [nil, true, 99].my_any                              #=> true
# puts [].my_any                                           #=> false

# 8
# friends_strings.my_none{|friend| friend.length > 5}
# puts %w{ant bear cat}.my_none { |word| word.length == 5 } #=> true
# puts %w{ant bear cat}.my_none { |word| word.length >= 4 } #=> false
# puts %w{ant bear cat}.my_none(/d/)                        #=> true
# puts [1, 3.14, 42].my_none(Float)                         #=> false
# puts [].my_none                                           #=> true
# puts [nil].my_none                                        #=> true
# puts [nil, false].my_none                                 #=> true
# puts [nil, false, true].my_none                           #=> false

# 9
# friends_ints.my_count
# puts [1, 2, 4, 2].my_count(2)            #=> 2
# puts [1, 2, 4, 2].my_count               #=> 4
# puts [1, 2, 4, 2].my_count{ |x| x%2==0 } #=> 3

# 10
# puts friends_strings.my_map {|friend| friend.length > 5}
# (1..4).my_map { |i| i*i }      #=> [1, 4, 9, 16]
# (1..4).my_map { "cat"  }   #=> ["cat", "cat", "cat", "cat"]

# 11
# puts friends_ints.my_inject { |sum, friend| sum + friend }
# puts friends_ints.my_inject { |sum, friend| sum * friend }
# puts (5..10).my_inject(:+)                             #=> 45
# puts (5..10).my_inject { |sum, n| sum + n }            #=> 45
# puts (5..10).my_inject(1, :*)                          #=> 151200
# puts (5..10).my_inject(1) { |product, n| product * n } #=> 151200
# # find the longest word
# longest = %w{ cat sheep bear }.my_inject do |memo, word|
#    memo.length > word.length ? memo : word
# end
# puts longest                                        #=> "sheep"

# 12
# friends_ints.multiply_els

# 13
#proc = Proc.new{|friend| friend.length > 5 ? friend : nil}
#proc = Proc.new{|friend| friend+"s"}
#friends_strings.my_map_proc(proc)

# 14
# proc = proc { |friend| friend.length > 5 ? friend : nil }
# friends_strings.my_map_proc_block(proc)
# friends_strings.my_map_proc_block(proc) { |friend| "#{friend}s" }
