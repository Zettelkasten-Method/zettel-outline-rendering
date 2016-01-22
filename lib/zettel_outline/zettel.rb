module ZettelOutline
  class Zettel
    def initialize(path)
      raise "file path needed" if path.nil?
      raise "file expected at path" unless File.file?(path)
      
      @path = path
    end
  
    def render
      remove_header(file_contents).join("")
    end
  
    def file_contents
      File.readlines(@path)
    end
    
    def remove_header(text)
      text
    end
  end
  
  class NullZettel
    def render
      ""
    end
  end
end
