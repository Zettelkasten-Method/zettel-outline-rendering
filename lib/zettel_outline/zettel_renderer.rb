module ZettelOutline
  class ZettelRenderer
  
    def render(contents, separator)
      "".tap do |output|
        output << separator.render
        output << contents.render
        output << "\n\n"
      end
    end
  end
end
