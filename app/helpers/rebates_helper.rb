module RebatesHelper

  def render_table(text)

    table = text.scan(/<table>(.*)<\/table>/im)

    if table.size == 0
      return text
    end

    table = table[0][0].to_s

    rows = []
    table.scan(/(.*)\n*/i).each do |r|
      r = r[0].strip
      unless r.to_s == ""
        rows.push(r.to_s)
      end
    end

    cells = []
    rows.each do |r|
      cells.push(r.gsub(", ",",").split(/,(?!(?:[^",]|[^"],[^"])+")/))
    end

    result = "<table>"
    cells.each do |cell|
      result += "<tr>"
      cell.each do |c|
        if c.include? '"'
          c = c.strip()[1,c.length-2]
        end
        result += "<td>"+c+"</td>"
      end
      result += "</tr>"
    end
    result += "</table>"

    text.gsub(/<table>(.*)<\/table>/im, result)

  end

end
