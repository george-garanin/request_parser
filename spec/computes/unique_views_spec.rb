RSpec.describe Computes::UniqueVisits do
  let(:loaded_file) do
    {
      '/help_page/1' =>
      {
        '126.318.035.038' => 4,
        '929.398.951.889' => 4,
        '722.247.931.582' => 4
      },
      '/about' =>
      {
        '136.318.035.038' => 2,
        '333.398.951.889' => 4,
        '555.247.931.582' => 1
      }
    }
  end

  let(:expected_rigth_calculation) do
    [
      ['/help_page/1', 3],
      ['/about', 3]
    ]
  end

  let(:reversive_sorting_rigth_calculation) { expected_rigth_calculation.reverse }
  let(:calculated_uniq_views) { described_class.new(loaded_file).calculate }
  let(:calculated_uniq_views_empty_array) { described_class.new({}).calculate }

  describe 'Instanse methods' do
    subject { described_class.new([]) }

    it 'should have #calculate' do
      expect(subject).to respond_to(:calculate)
    end
  end

  describe 'Compute total visits' do
    context 'when correct input' do
      subject { described_class.new(loaded_file).calculate }

      it 'should equal expected_rigth_calculation' do
        expect(subject).to contain_exactly(*expected_rigth_calculation)
      end

      it 'should not have reverse sorting' do
        expect(subject.first).to eql(reversive_sorting_rigth_calculation.last)
      end
    end

    context 'when empty input' do
      subject { described_class.new(Hash[]).calculate }

      it 'should be equal empty array' do
        expect(subject).to eql([])
      end
    end
  end
end
