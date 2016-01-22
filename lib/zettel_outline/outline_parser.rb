class OutlineParser
  def parse(content)
    result = []
    result = content.each_line
      .map    { |l| l.strip }
      .select { |l| !l.empty? }
      .map    { |l| cleanup(l) }
  end

  def cleanup(line)
    raise "empty line" if line.nil? || line.empty?
  
    line[/^[\* ]*(.+)$/, 1]
  end
end
