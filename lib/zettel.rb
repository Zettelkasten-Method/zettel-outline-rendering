class Zettel
  def initialize(file)
    raise "file needed" if file.nil?
    @path = file
  end
  
  def render
    remove_header(File.readlines(@path)).join("")
  end
  
  def remove_header(text)
    text
  end
end
