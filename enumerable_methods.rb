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

friends = ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']

my_each(friends) { |friend| puts friend }
my_each_with_index(friends) { |friend, index| puts friend + index.to_s }
