require 'spec_helper'
require 'zettel_outline/archive'

class TestableArchive < ZettelOutline::Archive
  attr_reader :did_create_zettel_with
  
  def create_zettel(path)
    @did_create_zettel_with = path
  end
end

describe ZettelOutline::Archive do
  let(:folder) { "some/folder/path" }
  
  describe 'fetching a Zettel' do
    let(:id) { "the ID" }
    
    context 'when a file was found' do
      subject(:archive) { TestableArchive.new(folder) }
      
      let(:path) { "the/resulting/path" }
      let(:finder) { double(:file_path => path) }
      
      before(:each) do
        archive.zettel(id, finder)
      end
      
      it 'fetches path from finder' do
        expect(finder).to have_received(:file_path).with(folder, id)
      end
      
      it 'creates zettel from resulting path' do
        expect(archive.did_create_zettel_with).to eq path
      end
    end
    
    context 'when no file was found' do
      subject(:archive) { described_class.new(folder) }
      
      let(:finder) { double(:file_path => nil) }
      let!(:result) { archive.zettel(id, finder) }
      
      it 'fetches path from finder' do
        expect(finder).to have_received(:file_path).with(folder, id)
      end
      
      it 'returns NullZettel' do
        expect(result.class).to equal ZettelOutline::NullZettel
      end
    end
  end
end