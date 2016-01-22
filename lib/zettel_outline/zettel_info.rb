module ZettelOutline
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
  
    def render
      "".tap do |output|
        output << "\n"
        output << %Q{<!-- §#{id} #{title}-->\n}
        output << %Q{<!-- #{comment}-->\n} unless comment.nil?
        output << "\n"
      end
    end
  end
end
