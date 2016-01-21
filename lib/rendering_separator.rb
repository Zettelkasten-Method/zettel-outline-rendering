class RenderingSeparator
  
  attr_accessor :id, :title, :comment
  
  def initialize(attrs={})
    attrs.each do |k,v| send("#{k}=",v) end 
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
