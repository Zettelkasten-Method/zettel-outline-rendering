require "zettel_outline/outline_parser"

module ZettelOutline
  class Outline
    attr_reader :content
    attr_reader :files
  
    def initialize(content)
      @content = content || ""
    end
  
    def files(parser = OutlineParser.new)
      return [] if @content.empty?
      
      @files = parser.parse(content) if @files.nil?
      @files
    end
  
    def map_files(parser = OutlineParser.new, &block)
      if block_given?
        files(parser).map { |f| yield f }
      else 
        to_enum(:map_files, parser)
      end
    end
  end
end
