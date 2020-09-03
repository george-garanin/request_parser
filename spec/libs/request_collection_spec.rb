RSpec.describe Libs::RequestCollection do
  subject { described_class.new }

  describe 'Instance methods' do
    it 'should have #add_user_request' do
      expect(subject).to respond_to(:add_user_request)
    end

    it 'should have #data' do
      expect(subject).to respond_to(:data)
    end
  end

  describe 'Result' do
    context 'when correct input' do
      let(:user_request) { '/home 111.222.333.444' }
      let(:expected_data) do
        Hash['/home', { '111.222.333.444' => 1 }]
      end

      it 'should have hash with added request' do
        subject.add_user_request(user_request)

        expect(subject.data.to_s).to eql(expected_data.to_s)
      end
    end

    context 'when empty input' do
      let(:user_request) { ' ' }
      let(:expected_empty_hash) { Hash[] }

      it 'should have empty hash' do
        subject.add_user_request(user_request)

        expect(subject.data.to_s).to eql(expected_empty_hash.to_s)
      end
    end
  end
end
