require 'zettel_outline/zettel'

module ZettelOutline
  
  class Finder
    def file_path(folder, id)
      Dir.glob(File.join(folder, "#{id}*")).first
    end
  end
  
  class Archive
    def initialize(folder)
      @folder = folder
    end
  
    def zettel(id, finder = Finder.new)
      create_zettel(path(id, finder))
    end
    
    def create_zettel(path)
      return NullZettel.new if path.nil?
      
      Zettel.new(path)
    end  

    def path(id, finder = Finder.new)
      finder.file_path(@folder, id)
    end
  end
end
