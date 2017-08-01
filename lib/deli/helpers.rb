
module Deli

  # for example:
  # http://www.rubyflow.com/p/ss63xj-orchparty-lets-you-generate-docker-compose-file-with-a-clean-ruby-dsl?utm_source=feedburner&utm_medium=feed&utm_campaign=Feed%3A+Rubyflow+%28RubyFlow%29
  #
  def self.sanitize(href)

    m = href.match(/\A(.+)\?utm_/)
    m ? m[1] : href
  end
end
