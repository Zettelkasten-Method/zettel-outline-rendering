require File.expand_path(File.dirname(__FILE__) + '/zettel')

class Archive
  def initialize(folder)
    @folder = folder
  end
  
  def zettel(id)
    Zettel.new(file_path(id))
  end
  
  private
  
  def file_path(id)
    Dir.glob(File.join(@folder, "#{id}*")).first
  end
end
