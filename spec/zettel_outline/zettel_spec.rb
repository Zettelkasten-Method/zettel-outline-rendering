require 'spec_helper'
require 'zettel_outline/zettel'

class TestableZettel < ZettelOutline::Zettel 
  attr_accessor :contents_double
  
  def initialize(contents)
    @contents_double = contents
  end
  
  def file_contents
    contents_double
  end
end

describe ZettelOutline::Zettel do
  describe 'initialization with nil' do
    it { expect { described_class.new(nil) }.to raise_exception "file path needed" }
  end
  
  describe 'initialization with path to directory' do
    it { expect { described_class.new("/tmp/") }.to raise_exception "file expected at path" }
  end
  
  describe 'initialization with path to non-existing file' do
    it { expect { described_class.new("/xtmp/foobar") }.to raise_exception "file expected at path" }
  end
  
  describe 'initialization with path to existing file' do
    let(:path) { "/tmp/201601221751-tempfile" }
    
    before(:each) do
      %x{touch "#{path}"}
    end
    
    it { expect { described_class.new(path) }.not_to raise_exception }
    it { expect(described_class.new(path)).not_to be_nil }
  end
  
  describe 'rendering' do
    let(:contents) { ["a", "b", "c"] }
    subject(:zettel) { TestableZettel.new(contents) }
    
    it 'returns file contents as one string' do
      expect(zettel.render).to eq "abc"
    end
  end
end
