module ZettelOutline
  class Outline
    attr_reader :content
    attr_reader :files
  
    def initialize(content: nil)
      @content = content
    end
  
    def files
      parse_files if @files.nil?
    end
  
    def map_files(&block)
      files.map { |f| yield f }
    end
  
    private
  
    def parse_files
      result = []
      result = content.each_line
        .map    { |l| l.strip }
        .select { |l| !l.empty? }
        .map    { |l| cleanup(l) }
    
      @files = result
    end
  
    def cleanup(line)
      raise "empty line" if line.nil? || line.empty?
    
      line[/^[\* ]*(.+)$/, 1]
    end
  end
end
