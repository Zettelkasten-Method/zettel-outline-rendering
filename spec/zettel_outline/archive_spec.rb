require 'spec_helper'
require 'zettel_outline/archive'

describe ZettelOutline::Archive do
  let(:folder) { "some/folder/path" }
  subject(:archive) { ZettelOutline::Archive.new(folder) }
  
  describe 'fetching a Zettel' do
    let(:id) { "the ID" }
    
    context 'when a file was found' do
      let(:path) { "the/resulting/path" }
      let(:finder) { double(:file_path => path) }
      
      it 'does not throw' do
        expect { archive.zettel(id, finder) }.not_to raise_exception
      end
    end
    
    context 'when no file was found' do
      let(:finder) { double(:file_path => nil) }
      
      it 'throws' do
        expect { archive.zettel(id, finder) }.to raise_exception("file path needed")
      end
    end
  end
end