#require File.expand_path(File.dirname(__FILE__) + '/zettel_renderer')

class OutlineItem
  
  def initialize(zettel_info)
    @zettel_info = zettel_info
  end
  
  def render(renderer, archive)
    renderer.render(zettel(archive), @zettel_info)
  end
  
  private 
  
  def zettel(archive)
    id = @zettel_info.id
    archive.zettel(id)
  end
end