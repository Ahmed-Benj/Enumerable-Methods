# rubocop:disable all

# 2 3
module Enumerable
  # 3
  def my_each
    if block_given?
      iterator = 0
      arr = to_a
      while iterator < arr.length
        yield(arr[iterator])
        iterator += 1
      end
      self
    else
      to_enum(__method__)
    end
  end

  # 4
  def my_each_with_index
    if block_given?
      iterator = 0
      arr = to_a
      while iterator < arr.length
        yield(arr[iterator], iterator)
        iterator += 1
      end
      self
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
      output_array
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
        output_array.push(obj) if obj != false and !obj.nil?
      end
    end
    result = output_array.length == length
  end

  # 7
  def my_any(pattern = nil)
    result = false
    if pattern
      my_each do |element|
        result = true if pattern === element
      end
    elsif block_given?
      my_each do |element|
        result = true if yield(element)
      end
    elsif !block_given?
      my_each do |obj|
        result = true if obj
      end
    end
    result
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
        output_array.push(obj) if obj != false and !obj.nil?
      end
    end
    result = output_array.length.zero?
  end

  # 9
  def my_count(arg = nil)
    output = 0
    if arg
      my_each do |element|
        output += 1 if arg == element
      end
    elsif block_given?
      my_each do |element|
        output += 1 if yield(element)
      end
    elsif !block_given?
      my_each do |_element|
        output += 1
      end
    end
    output
  end

  # 10
  def my_map
    arr = nil
    array_type = lambda do |_input_type|
      arr = to_a
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
    output_array
  end

  # 11
  def my_inject(*args)
    arr = to_a
    if block_given?
      if args.length == 1
        result = args[0]
        result = yield(result, arr[0])
      else
        result = arr[0]
      end
      temp = arr.drop(1)
      temp.my_each do |element|
        result = yield(result, element)
      end
    elsif !block_given?
      case args.length
      when 1
        acc = args[0]
        result = arr[0]
        temp = arr.drop(1)
        temp.my_each do |element|
          result = result.send(acc, element)
        end
      when 2
        result = args[0]
        acc = args[1]
        arr.my_each do |element|
          result = result.send(acc, element)
        end
      end
    end
    result
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
    output_array
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
    output_array
  end
end
