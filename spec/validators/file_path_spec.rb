RSpec.describe Validators::FilePath, type: :class do
  let(:pwd) { Dir.pwd }

  describe 'Instance methods' do
    let(:path_to_log_file) { pwd + '/spec' + '/fixtures' + '/files' + '/example.log' }
    subject { described_class.new(path_to_log_file) }

    it 'should have #valid?' do
      expect(subject).to respond_to(:valid?)
    end

    it 'should have #errors' do
      expect(subject).to respond_to(:errors)
    end
  end

  describe 'Validation result' do
    context 'when log file have correct path' do
      let(:path_to_log) { pwd + '/spec' + '/fixtures' + '/files' + '/example.log' }
      subject { described_class.new(path_to_log) }

      it 'should be valid' do
        expect(subject.valid?).to eql(true)
      end
    end

    context 'when log file have wrong path' do
      let(:path_to_wrong_log_file) { pwd + '/spec' + '/fixtures' + '/files' + '/example.log2' }
      subject { described_class.new(path_to_wrong_log_file) }

      it 'should be not valid' do
        expect(subject.valid?).to eql(false)
      end
    end

    context 'when path to txt file' do
      let(:path_to_txt_file) { pwd + '/spec' + '/fixtures' + '/files' + '/example.txt' }
      let(:expected_errors) {
        [
          "Filename have wrong extencion. Should have *.log"
        ]
      }
      subject { described_class.new(path_to_txt_file) }

      it 'should be not valid' do
        expect(subject.valid?).to eql(false)
      end

      it 'should have errors' do
        subject.valid?
        expect(subject.errors).to contain_exactly(*expected_errors)
      end
    end
  end
end
