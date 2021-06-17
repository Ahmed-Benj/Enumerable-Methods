require_relative '../enumerable_methods'
# rubocop:disable all

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
end
