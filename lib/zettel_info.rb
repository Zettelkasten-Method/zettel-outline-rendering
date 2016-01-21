require File.expand_path(File.dirname(__FILE__) + '/zettel_renderer')
require File.expand_path(File.dirname(__FILE__) + '/rendering_separator')
require File.expand_path(File.dirname(__FILE__) + '/zettel')

class ZettelInfo

  def initialize(line)
    @line = line
  end
  
  def id
    @line[/[0-9]+/]
  end
  
  def title
    @line[/[0-9]+ ([\d\w_\- ]+?)(?:\..*)?$/, 1]
  end
  
  def comment
    @line[/[0-9]+ [\d\w_\- ]+\.[ ]*(.*)$/, 1]
  end
  
  def info
    { id: id, title: title, comment: comment }
  end
  
  def render(renderer, folder)
    renderer.render(zettel(folder), separator)
  end
      
  def separator
    RenderingSeparator.new(info)
  end
  
  private 
  
  def zettel(folder)
    Zettel.new(file(folder))
  end
  
  def file(folder)
    Dir.glob(File.join(folder, "#{id}*")).first
  end
end
