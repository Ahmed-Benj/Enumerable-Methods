require_relative '../enumerable_methods'

describe Enumerable do
  let(:ints) { [3, 4, 5] }
  friends = %w[Sharon Leo Leila Brian Arun]
  friends_strings = %w[Sharon Leo Leila Brian Arun]

  describe '#my_each' do
    it 'Executes a block of code' do
      expect(ints.my_each { |x| x * 5 }).to eq(ints.each { |x| x * 5 })
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
end
