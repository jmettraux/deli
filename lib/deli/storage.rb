
module Deli::Storage

  PATH = 'var/links.txt'

  LINE_REGEX = /\A(.+) (http[^ ]+) (.*)\z/
  LINK_REGEX = /\Ahttps?:\/\/[^\s]+\z/

  def self.bookmarks

    File.readlines(PATH, :encoding => 'UTF-8')
      .reverse
      .collect { |line|
        m = LINE_REGEX.match(line.strip)
        m ? m.to_a[1..-1] : nil }
      .compact

  rescue => err

    p err
    puts err.backtrace

    []
  end

  def self.save(session, params)

    t = Time.parse(params[:time])

    l = params[:link].strip
    l.match(LINK_REGEX) || fail(ArgumentError.new('invalid link'))

    d = params[:description].strip

    File.open(PATH, 'ab:UTF-8') do |f|
      f.puts([ t.to_s, l, d ].join(' '))
    end

    session['_flash_success'] = 'successfully saved link'

    true

  rescue => err

    session['_flash_error'] = err.to_s

    false
  end
end

