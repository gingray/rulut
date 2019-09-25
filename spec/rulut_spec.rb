RSpec.describe Rulut, focus: true do
  describe Rulut::Parser::Cube do
    # let(:input) { "# some comments 1231\n# some other comments" }
    let(:input) { file_fixture('cube/small.cube').read }
    let(:result) { Rulut::Parser::Cube.parse(input) }
    it do
      expect(result).to eq ''
    end
  end
end
