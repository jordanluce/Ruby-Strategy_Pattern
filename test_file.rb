class Report
  attr_reader :title, :text
  attr_accessor :formatter

  def initialize(formatter)
    @title = 'Monthly Report'
    @text = ['Thing that matter', 'Fanny Fatkinn']
    @formatter = formatter
  end

  def output_report
    @formatter.output_report(@title, @text)
  end
end

class HtmlFormatter
  def output_report(title, text)
    puts('<html>')
    puts('  <head>')
    puts("   <title>#{title}</title>")
    puts('  </head>')
    puts('  <body>')
    text.each do |line|
      puts("<p>#{line}</p>")
    end
    puts('  </body>')

    puts('</html>')
  end
end

class PlainTextFormatter
  def output_report(title, text)
    puts("****** #{title} ******")
    text.each do |line|
      puts(line)
    end
  end
end

#report = Report.new(HtmlFormatter.new)
#report.output_report

#report = Report.new(PlainTextFormatter.new)
#report.output_report



class Report
  attr_reader :title, :text
  attr_accessor :formatter

  def initialize(&formatter)
    @title = 'Monthly Report'
    @text = ['The Goat', 'Fanny Fatkinn']
    @formatter = formatter
  end

  def output_report
    @formatter.call( self )
  end
end

HTML_FORMATTER = lambda do |context|
  puts('<html>')
  puts('  <head>')
  puts("   <title>#{context.title}</title>")
  puts('  </head>')
  puts('  <body>')
  context.text.each do |line|
    puts("<p>#{line}</p>")
  end
  puts('  </body>')

  puts('</html>')
end

report = Report.new do |context|
  puts("****** #{context.title} ******")
  context.text.each do |line|
      puts(line)
  end
end
report.output_report


#report = Report.new(PlainTextFormatter.new)
#report.output_report
