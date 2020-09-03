RSpec.describe Structs::UserRequest do
  describe 'attributes' do
    subject { described_class.new('/home', '111.222.333.444') }

    it 'should have #url' do
      expect(subject).to respond_to(:url)
    end

    it 'should have #ip' do
      expect(subject).to respond_to(:ip)
    end
  end
end
