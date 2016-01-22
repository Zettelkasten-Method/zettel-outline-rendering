require "zettel_outline/version"
require 'zettel_outline/outline'
require 'zettel_outline/outline_item'
require 'zettel_outline/archive'
require 'zettel_outline/zettel_info'
require 'zettel_outline/zettel_renderer'
require 'zettel_outline/zettel'

module ZettelOutline

  class << self
    
    def compile(outline_content, folder)
      outline = Outline.new(outline_content)
      all_items = outline.map_files { |f| ZettelInfo.new(f) }
        .map { |info| OutlineItem.new(info) }
      renderer = ZettelRenderer.new()
      archive = Archive.new(folder)
  
      all_items.map { |z| z.render(renderer, archive) }
    end
    
    def render(outline)
      outline.reduce("", :<<)
    end
  end
end
