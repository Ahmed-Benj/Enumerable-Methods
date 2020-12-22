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

def my_all (input_array)
  output_array = []
  my_each(input_array) do |element|
  if yield(element)
   output_array.push(element)
  end
  end
  result = output_array.length == input_array.length
 print result
 end
 
def my_any (input_array)
  result = false
  my_each(input_array) do |element|
  if yield(element)
   result = true
   print result
   exit
  end
  end
 print result
 end

 def my_none (input_array)
  output_array = []
  my_each(input_array) do |element|
  if yield(element)
   output_array.push(element)
  end
  end
  result = output_array.length == 0
 print result
 end

friends = ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']

#my_each(friends) { |friend| puts friend }
#my_each_with_index(friends) { |friend, index| puts friend + index.to_s }
#my_select(friends) {|friend| friend != "Brian"}
#my_all(friends) {|friend| friend.length > 5}
#my_any(friends) {|friend| friend.length == 2}
#my_none(friends) {|friend| friend.length > 5}
