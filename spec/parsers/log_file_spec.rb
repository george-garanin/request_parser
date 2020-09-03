RSpec.describe Parsers::LogFile, type: :class do
  let(:pwd) { Dir.pwd }
  let(:path_to_log_file) { pwd + '/spec' + '/fixtures' + '/files' + '/example.log' }
  let(:path_to_log_file_with_empty_lines) { pwd + '/spec' + '/fixtures' + '/files' + '/wrong_example.log' }

  describe 'Instance methods' do
    subject { described_class.new(path_to_log_file) }

    it 'should have #parse' do
      expect(subject).to respond_to(:parse)
    end
  end

  describe 'Data structure' do
    context 'after parse file' do
      subject { described_class.new(path_to_log_file).parse }

      it 'should have hash for url' do
        expect(subject['/contact']).to be_a(Hash)
      end

      it 'should have Integer for visits from IP' do
        expect(subject['/contact']['184.123.665.067']).to be_a(Integer)
      end
    end
  end

  describe 'Parsing file' do
    context 'when correct log file' do
      subject { described_class.new(path_to_log_file).parse }

      let(:expected_data) do
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

      it 'should equal expected_data' do
        expect(subject.to_s).to eql(expected_data.to_s)
      end
    end

    context 'when log file with empty lines' do
      subject { described_class.new(path_to_log_file).parse }

      let(:expected_data) do
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

      it 'should equal expected_data' do
        expect(subject.to_s).to eql(expected_data.to_s)
      end
    end
  end
end
