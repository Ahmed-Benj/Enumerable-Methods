require_relative '../enumerable_methods'
#rubocop:disable all

describe Enumerable do
  let(:ints) { [3, 4, 5] }
  let(:friends) { %w[Sharon Leo Leila Brian Arun] }
  let(:friends_strings) { %w[Sharon Leo Leila Brian Arun] }

  describe '#my_each' do
    it 'Executes a block of code' do
      expect(ints.my_each { |x| (x * 5) }).to eq(ints.each { |x| (x * 5) })
    end
  end

  describe '#my_each_with_index' do
    it 'Executes a block of code' do
      expect(friends.my_each_with_index do |friend, index|
               puts friend + index.to_s
             end).to eq(friends.each_with_index do |friend, index|
                          puts friend + index.to_s
                        end)
    end
  end

  describe '#my_select' do
    it 'Select elements from array and put them into another' do
      expect(friends.my_select { |friend| friend == 'Brian' }).to eq(friends.select { |friend| friend == 'Brian' })
    end
  end

  describe '#my_all' do
    it 'Returns true if all friends length > 5' do
      expect(friends_strings.my_all { |friend| friend.length > 5 }).to eq(friends_strings.all? do |friend|
                                                                            friend.length > 5
                                                                          end)
    end
  end

  describe '#my_any' do
    it 'Returns true if any friend length = 3' do
      expect(friends_strings.my_any { |friend| friend.length == 3 }).to eq(friends_strings.any? do |friend|
                                                                             friend.length == 3
                                                                           end)
    end
  end

  describe '#my_none' do
    it 'Returns true if no friend length = 3' do
      expect(friends_strings.my_none { |friend| friend.length == 3 }).to eq(friends_strings.none? do |friend|
                                                                             friend.length == 3
                                                                           end)
    end
  end


  describe '#my_count' do
    it 'Returns the number of elements in the array' do
      expect(friends_strings.my_count).to eq(friends_strings.count)
    end
  end

  describe '#my_map' do
    it 'Returns a modified array' do
      expect(ints.my_map { |i| i*i }).to eq(ints.map { |i| i*i })
    end
  end
  
  describe '#my_inject' do
    it 'Returns the sum of array elements' do
      expect(ints.my_inject { |sum, friend| sum + friend }).to eq(ints.inject { |sum, friend| sum + friend })
    end
  end

end
