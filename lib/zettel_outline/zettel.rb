module ZettelOutline
  class Zettel
    def initialize(path)
      raise "file path needed" if path.nil?
      @path = path
    end
  
    def render
      remove_header(File.readlines(@path)).join("")
    end
  
    def remove_header(text)
      text
    end
  end
end
