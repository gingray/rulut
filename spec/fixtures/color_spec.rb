RSpec.describe Rulut, focus: true do
  describe 'Rulut::Color' do
    let(:input) { [33, 23, 42] }
    let(:result) { Rulut::Color.rgb_to_hsl(*input) }
    it do
      expect(result).to eq [272, 29, 13]
    end
  end
end
