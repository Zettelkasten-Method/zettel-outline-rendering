# outline = <<EOF
# * 123 test. the comment
# * 234 foo x boo. moo. shmoo
#     * 567 bar
# * 890 baz
# EOF

require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')
require File.expand_path(File.dirname(__FILE__) + '/../../compile')

describe ZettelInfo do
  
  describe 'conventional id and title' do
    let(:line) { "201510101029 the title" }
    subject(:info) { ZettelInfo.new(line) }
    
    it 'strips the ID' do
      expect(subject.id).to eq "201510101029"
    end
    
    it 'strips the title' do 
      expect(subject.title).to eq "the title"
    end
    
    it 'has no comment' do
      expect(subject.comment).to be_nil
    end
  end
  
  describe 'including comment' do
    let(:line) { "1234567 ze title. the comment" }
    subject(:info) { ZettelInfo.new(line) }
    
    it 'strips the ID' do
      expect(subject.id).to eq "1234567"
    end
    
    it 'strips the title' do 
      expect(subject.title).to eq "ze title"
    end
    
    it 'strips the comment' do
      expect(subject.comment).to eq "the comment"
    end
  end
  
  describe 'rendering' do
    subject(:info) { ZettelInfo.new("123 title. comment") }
    let(:rendition) { "the result" }
    let(:renderer) { double(:render => rendition) }
    
    before(:each) do
      renderer.should_receive(:render)
    end
    
    it 'renders' do
      info.render(renderer, folder)
      
      expect(renderer).to have_received(:render).with()
    end
    
    it 'returns renderer result' do
      expect(info.render(renderer, folder)).to eq rendition
    end
  end
end