require 'spec_helper'
require 'zettel_outline/outline_item'

describe ZettelOutline::OutlineItem do
  describe 'rendering' do
    let(:id) { "123" }
    let(:info) { double(:id => id) }
    subject(:item) { ZettelOutline::OutlineItem.new(info) }
    
    let(:rendition) { "the result" }
    let(:renderer) { double(:render => rendition) }

    let(:zettel) { double() }
    let(:archive) { double(:zettel => zettel) }
    
    
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