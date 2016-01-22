require File.expand_path(File.dirname(__FILE__) + '/lib/outline')
require File.expand_path(File.dirname(__FILE__) + '/lib/outline_item')
require File.expand_path(File.dirname(__FILE__) + '/lib/archive')
require File.expand_path(File.dirname(__FILE__) + '/lib/zettel_info')
require File.expand_path(File.dirname(__FILE__) + '/lib/zettel_renderer')
require File.expand_path(File.dirname(__FILE__) + '/lib/zettel')

def compile(content, folder)
  outline = Outline.new(content: content)
  all_items = outline.map { |l| ZettelInfo.new(l) }
    .map { |info| OutlineItem.new(info) }
  renderer = ZettelRenderer.new()
  archive = Archive.new(folder)
  
  all_items.map { |z| z.render(renderer, archive) }
end

PATH = File.expand_path("~/Archiv/")

testoutline = <<EOF
* 201509250830 Wie man mit Ausnahmen bei guten Habits umgeht. the comment
* 201510101029 Bilderquellen im Internet. another comment
    * 201509281235 Serial Queues 
* 201509011226 Freie Funktionen über
EOF

#zettel = compile(testoutline, PATH)
#zettel.each do |zettel|
#  puts zettel
#end

