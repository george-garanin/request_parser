RSpec.describe Loaders::LogFile do
  let(:pwd) { Dir.pwd }

  let(:expected_parsed_file) do
    {
      '/help_page/1' => {
        '126.318.035.038' => 1,
        '929.398.951.889' => 1,
        '722.247.931.582' => 1,
        '646.865.545.408' => 1
      },
      '/contact' => { '184.123.665.067' => 1 },
      '/home' => { '184.123.665.067' => 1,
                   '235.313.352.950' => 1 },
      '/about/2' => { '444.701.448.104' => 1 },
      '/index' => { '444.701.448.104' => 1 },
      '/about' => { '061.945.150.735' => 1 }
    }
  end

  describe 'Instance methods' do
    let(:path_to_log_file) { pwd + '/spec' + '/fixtures' + '/files' + '/example.log' }
    subject { described_class.new(path_to_log_file) }

    it 'should have #load' do
      expect(subject).to respond_to(:load)
    end
  end

  describe 'Result' do
    context 'when log file have correct data' do
      let(:path_to_log) { pwd + '/spec' + '/fixtures' + '/files' + '/example.log' }
      subject { described_class.new(path_to_log).load }

      it 'should have hash for url' do
        expect(subject['/contact']).to be_a(Hash)
      end

      it 'should have Integer for visits from IP' do
        expect(subject['/contact']['184.123.665.067']).to be_a(Integer)
      end

      it 'should be equal expected_parsed_file' do
        expect(subject).to contain_exactly(*expected_parsed_file)
      end
    end

    context 'when log file have empty lines' do
      let(:path_to_log_with_empty_lines) { pwd + '/spec' + '/fixtures' + '/files' + '/wrong_example.log' }
      subject { described_class.new(path_to_log_with_empty_lines).load }

      it 'should be equal expected_parsed_file' do
        expect(subject).to contain_exactly(*expected_parsed_file)
      end
    end

    context 'when wrong path to file' do
      let(:path_to_nothing) { pwd + '/spec' + '/fixtures' + '/files' + '/nothing.log' }
      subject { described_class.new(path_to_nothing).load }

      it 'should return nil if file missing' do
        expect(subject).to eql(nil)
      end
    end

    context 'when path to *.txt file' do
      let(:path_to_txt) { pwd + '/spec' + '/fixtures' + '/files' + '/example.txt' }
      subject { described_class.new(path_to_txt).load }

      it 'should return nil if wrong extension' do
        expect(subject).to eql(nil)
      end
    end
  end
end
