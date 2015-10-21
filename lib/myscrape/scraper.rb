require 'metainspector'

class Myscrape::Scraper
  attr_reader :root

  def initialize(root)
    @root = root
  end

  def page
    @page ||= MetaInspector.new(root)
  rescue Faraday::SSLError
    warn "SSL error on #{root}"
  end

  def url
    page.url
  end

  def summary
    {
      url: url,
      links: relative_links,
      assets: assets
    }
  end

  # scrape internal pages linked from this page (does not recurse deeper)
  def subscrape(limit: 3)
    links[0..limit-1].map do |link|
      scraper = self.class.new(link)
      if block_given?
        yield scraper
      else
        scraper.summary
      end
    end
  end


  def relative_links
    links.map {|url| URI.parse(url).path}
  end

  def links
    all_links - head_links - [page.url]
  end

  def all_links
    page.links.internal.grep(/\//).map {|x| x.gsub(/#.*/, '')}.uniq
  end
  def head_links
    page.head_links.map{|x| x[:href]}
  end

  def assets
    css = page.stylesheets.map { |p| p[:href] }
    images = page.images.to_a
    css + images
  end
end
