RSpec.describe Rulut, focus: true do
  describe 'Rulut::Cube' do
    # let(:input) { "# some comments 1231\n# some other comments" }
    let(:input) { file_fixture('cube/small.cube').read }
    # let(:input) { file_fixture('cube/cinematic.cube').read }
    let(:result) { Rulut::Parser.parse_cube(input) }
    it do
      expect(result).to be_kind_of ::Treetop::Runtime::SyntaxNode
      expect(result.to_object).to be_a  Rulut::Cube
    end
  end
end
