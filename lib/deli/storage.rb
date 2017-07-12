
module Deli::Storage

  LINE_REGEX = /\A(.+) (http[^ ]+) (.*)\z/

  def self.bookmarks

    File.readlines('var/links.txt')
      .collect { |line|
        m = LINE_REGEX.match(line.strip)
        m ? m.to_a[1..-1] : nil }
      .compact

  rescue => err

    []
  end
end

