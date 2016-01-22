require 'spec_helper'
require 'zettel_outline/outline_parser'

TEST_OUTLINE = <<EOF
* 123 test. the comment

up next:
* 234 foo x boo. moo. shmoo
   * 567 bar
* 890 baz
EOF

TEST_OUTLINE_PARSED = [
  "123 test. the comment",
  "up next:",
  "234 foo x boo. moo. shmoo",
  "567 bar",
  "890 baz"
]

describe ZettelOutline::OutlineParser do
  subject(:parser) { ZettelOutline::OutlineParser.new }
  
  describe 'passing in padded lines' do
    it 'returns stripped lines' do
      expect(parser.parse("   hello    \n   xyz  ")).to eq ["hello","xyz"]
    end
  end
  
  describe 'passing in a markdown list item' do
    it 'returns line without markup' do
      expect(parser.parse("  *   hi there.  ")).to eq ["hi there."]
    end
  end
  
  describe 'passing in a complex outline' do
    it 'returns non-empty lines without markup' do
      expect(parser.parse(TEST_OUTLINE)).to eq TEST_OUTLINE_PARSED
    end
  end
end
