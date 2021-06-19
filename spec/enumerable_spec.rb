require_relative '../enumerable_methods'

describe Enumerable do
  let(:ints) { [3, 4, 5] }
  let(:friends) { %w[Sharon Leo Leila Brian Arun] }
  let(:friends_strings) { %w[Sharon Leo Leila Brian Arun] }

  describe '#my_each' do
    it 'Executes a block of code' do
      expect(ints.my_each { |el| puts(5 + el) }).to eq(ints.each { |el| puts(5 + el) })
    end

    it 'Executes a block of code' do
      expect(ints.my_each { |x| x + 5 }).not_to eq([0, 1])
    end
  end

  describe '#my_each_with_index' do
    it 'Executes a block of code and returns the passed enum' do
      expect(friends.my_each_with_index do |friend, index|
               puts friend + index.to_s
             end).to eq(friends.each_with_index do |friend, index|
                          puts friend + index.to_s
                        end)
    end

    it 'Executes a block of code and returns the passed enum' do
      expect((0..9).my_each_with_index { |x, y| x * y }).not_to eq((0..8))
    end
  end

  describe '#my_select' do
    it 'Select elements from array and put them into another' do
      expect(friends.my_select { |friend| friend == 'Brian' }).to eq(friends.select { |friend| friend == 'Brian' })
    end
    it 'Select elements from array and put them into another' do
      expect(friends.my_select { |friend| friend == 'Brian' }).not_to eq(['Arun'])
    end
  end

  describe '#my_all' do
    it 'Returns true if all friends length > 5' do
      expect(friends_strings.my_all { |friend| friend.length > 5 }).to eq(friends_strings.all? do |friend|
                                                                            friend.length > 5
                                                                          end)
    end

    it 'Returns false if not all friends length > 5' do
      expect(friends_strings.my_all { |friend| friend.length > 5 }).to eq(false)
    end
  end

  describe '#my_any' do
    it 'Returns true if any friend length = 3' do
      expect(friends_strings.my_any { |friend| friend.length == 3 }).to eq(friends_strings.any? do |friend|
                                                                             friend.length == 3
                                                                           end)
    end

    it 'Returns false if no friend length = 10' do
      expect(friends_strings.my_any { |friend| friend.length == 10 }).to eq(friends_strings.any? do |friend|
                                                                              friend.length == 10
                                                                            end)
    end
  end

  describe '#my_none' do
    it 'Returns false if one friend length = 3' do
      expect(friends_strings.my_none { |friend| friend.length == 3 }).to eq(false)
    end

    it 'Returns true if no friend length = 8' do
      expect(friends_strings.my_none { |friend| friend.length == 8 }).to eq(true)
    end
  end

  describe '#my_count' do
    it 'Returns the number of elements in the array' do
      expect(friends_strings.my_count).to eq(friends_strings.count)
    end

    it 'Returns the number of elements in the array' do
      expect(friends_strings.my_count).not_to eq(20)
    end
  end

  describe '#my_map' do
    it 'Returns a modified array' do
      expect(ints.my_map { |i| i * i }).to eq(ints.map { |i| i * i })
    end
  end

  describe '#my_inject' do
    it 'Returns the sum of array elements' do
      expect(ints.my_inject { |sum, friend| sum + friend }).to eq(ints.inject { |sum, friend| sum + friend })
    end
  end

  describe '#my_map_proc' do
    it 'Returns a modified array using proc' do
      proc = proc { |friend| "#{friend}s" }
      expect(friends_strings.my_map_proc(proc)).to eq(%w[Sharons Leos Leilas Brians Aruns])
    end
  end

  describe '#my_map_proc_block' do
    it 'Returns a modified array using proc instead of block' do
      proc = proc { |friend| friend.length > 5 ? friend : nil }
      expect(friends_strings.my_map_proc_block(proc) { |friend| "#{friend}s" }).to eq(['Sharon', nil, nil, nil, nil])
    end
  end
end
