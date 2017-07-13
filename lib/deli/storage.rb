
module Deli::Storage

  PATH = 'var/links.txt'

  LINE_REGEX = /\A(.+) (http[^ ]+) (.*)\z/
  LINK_REGEX = /\Ahttps?:\/\/[^\s]+\z/

  def self.bookmarks

    File.readlines(PATH)
      .reverse
      .collect { |line|
        m = LINE_REGEX.match(line.strip)
        m ? m.to_a[1..-1] : nil }
      .compact

  rescue => err

    []
  end

  def self.save(env, params)

    t = Time.parse(params[:time])

    l = params[:link].strip
    l.match(LINK_REGEX) || fail(ArgumentError.new('invalid link'))

    d = params[:description].strip

    File.open(PATH, 'ab') do |f|
      f.puts([ t.to_s, l, d ].join(' '))
    end

    env['_flash_success'] = 'successfully saved link'

  rescue => err

    env['_flash_error'] = err.to_s
  end
end

