require_relative '../enumerable_methods'

describe Enumerable do
  describe '#my_each' do
    let(:ints) { [3, 4, 5] }
    it 'Executes a block of code' do
      expect(ints.my_each { |x| x * 5 }).to eq(ints.each { |x| x * 5 })
    end
  end
end
