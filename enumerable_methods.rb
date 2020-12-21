def my_each (array)
  iterator = 0
  while iterator < array.length

    yield(array[iterator])

    iterator += 1

  end
end

def my_each_with_index (array)
  iterator = 0
  while iterator < array.length

    yield(array[iterator],iterator)

    iterator += 1

  end
end

def my_select (input_array)
 output_array = []
 my_each(input_array) do |element|
 if yield(element)
  output_array.push(element)
 end
 end
print output_array
end



friends = ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']

#my_each(friends) { |friend| puts friend }
#my_each_with_index(friends) { |friend, index| puts friend + index.to_s }
my_select(friends) {|friend| friend != "Brian"}