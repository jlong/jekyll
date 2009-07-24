module Jekyll

  module Filters
    def textilize(input)
      RedCloth.new(input).to_html
    end

    def date_to_string(date)
      date.strftime("%d %b %Y")
    end

    def date_to_long_string(date)
      date.strftime("%d %B %Y")
    end

    def date_to_xmlschema(date)
      date.xmlschema
    end

    def date_to_utc(date)
      date.utc
    end

    def xml_escape(input)
      input.gsub("&", "&amp;").gsub("<", "&lt;").gsub(">", "&gt;")
    end

    def number_of_words(input)
      input.split.length
    end

    def array_to_sentence_string(array)
      connector = "and"
      case array.length
      when 0
        ""
      when 1
        array[0].to_s
      when 2
        "#{array[0]} #{connector} #{array[1]}"
      else
        "#{array[0...-1].join(', ')}, #{connector} #{array[-1]}"
      end
    end

    def absolutize_urls(input, base)
      input.gsub(/(href|src)(\s*=\s*)(["'])(\/.*?)\3/) { $1 + $2 + $3 + base + $4 + $3 }
    end
  end
end
