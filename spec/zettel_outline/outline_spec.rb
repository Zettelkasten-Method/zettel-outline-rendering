require 'spec_helper'
require 'zettel_outline/outline'

describe ZettelOutline::Outline do
  
  context 'with outline' do
    let(:data) { "this is the source outline" }
    subject(:outline) { ZettelOutline::Outline.new(data) }
    
    let(:files) { ["two", "files"] }
    let(:parser) { double(:parse => files) }
    
    describe 'file list' do
      let!(:result) { outline.files(parser) }
      
      it 'forwards data to parser' do
        expect(parser).to have_received(:parse).with(data)
      end
      
      it 'returns parser result' do
        expect(result).to equal(files)
      end
    end
    
    describe 'mapping files' do
      context 'with block' do
        let!(:result) { outline.map_files(parser, &:upcase) }
        
        it 'forwards data to parser' do
          expect(parser).to have_received(:parse).with(data)
        end
        
        it 'maps over parser result' do
          expect(result).to eq(["TWO", "FILES"])
        end
      end
      
      context 'without block' do
        let!(:result) { outline.map_files(parser) }
                
        it 'returns result of kind Enumerator' do
          expect(result.class).to eq Enumerator
        end
        
        describe 'the result' do
          let!(:mapped_result) { result.map(&:upcase) }
          
          it 'forwards data to parser' do
            expect(parser).to have_received(:parse).with(data)
          end
          
          it 'enumerates over parse results' do
            expect(mapped_result).to eq ["TWO", "FILES"]
          end
        end
      end
    end
  end
  
  context 'with empty outline' do
    subject(:outline) { ZettelOutline::Outline.new("") }
    let(:parser) { double(:parse => nil) }
    
    describe 'file list' do
      let!(:result) { outline.files(parser) }
      
      it 'returns empty array' do
        expect(result).to eq []
      end
      
      it "doesn't delegate to parser" do
        expect(parser).not_to have_received(:parse)
      end
    end
    
    describe 'mapping files' do
      context 'with block' do
        let!(:result) { outline.map_files(parser, &:upcase) }
        
        it 'does not delegate to parser' do
          expect(parser).not_to have_received(:parse)
        end
        
        it 'returns empty array' do
          expect(result).to eq([])
        end
      end
      
      context 'without block' do
        let!(:result) { outline.map_files(parser) }
                
        it 'returns result of kind Enumerator' do
          expect(result.class).to eq Enumerator
        end
        
        describe 'the result' do
          let!(:mapped_result) { result.map(&:upcase) }
          
          it 'does not forward data to parser' do
            expect(parser).not_to have_received(:parse)
          end
          
          it 'is empty' do
            expect(mapped_result).to eq []
          end
        end
      end
    end
  end
end
