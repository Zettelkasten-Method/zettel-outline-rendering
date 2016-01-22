require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')
require File.expand_path(File.dirname(__FILE__) + '/../../compile')


describe OutlineItem do
  describe 'rendering' do
    let(:id) { "123" }
    let(:info) { double(:id => id) }
    subject(:item) { OutlineItem.new(info) }
    
    let(:rendition) { "the result" }
    let(:renderer) { double(:render => rendition) }

    let(:zettel) { double() }
    let(:archive) { double(:zettel => zettel) }
    
    before(:each) do
      #renderer.should_receive(:render)
    end
    
    it 'requests zettel from archive' do
      item.render(renderer, archive)
      
      expect(archive).to have_received(:zettel).with(id)
    end
    
    it 'delegates to renderer' do
      item.render(renderer, archive)
      
      expect(renderer).to have_received(:render).with(zettel, info)
    end
    
    it 'returns renderer result' do
      expect(item.render(renderer, archive)).to eq rendition
    end
  end
end