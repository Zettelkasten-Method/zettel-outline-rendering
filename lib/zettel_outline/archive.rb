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
      path = finder.file_path(@folder, id)
      Zettel.new(path)
    end  
  end
end
