# Myscrape

Implementation of a simple site-specific command-line scraper.

All the real work is delegated to the MetaInspector gem.

Given a URL, it will fetch that URL and all immediate internal links
from that page. Output is a JSON-formatted summary of the internal
links and (internal or external) assets (images & stylesheets) used on
each page.

## Installation

```ruby
git clone http://github.com/jmay/myscrape
```

## Usage

```ruby
myscrape/bin/scrape http://example.com/
```

To avoid pounding sites with lots of links, the scraper by default
will only pull 3 sub-pages.

## Comments

Prompt was as follows:

> Write a web crawler in a language of your choice. It should be limited
> to one domain - so when crawling opusforwork.com it would crawl all
> pages within the opusforwork.com domain, but not follow any outside
> links. Given a URL, it should output a site map, showing which static
> assets each page depends on, and the links between pages. Choose the
> most appropriate data structure to store & display this site map e.g.
> printing it to stdout or writing it to a file.

> Build this as you would something for production. Focus on code
> quality and write tests as appropriate.  Make sure to include a README
> documenting how you laid out the code and why you designed it the way
> you did.

Web crawling/scraping is well-known territory. There's rarely a reason
to build a new one from scratch, so I looked for a decent open-source
implementation to work from. There's an excellent Python package
called [Scrapy](http://scrapy.org) but that looked like overkill, and
I'm more familiar with Ruby.

MetaInspector is much lighter than Scrapy, but is actively under
development with [some outside contributions](https://github.com/jaimeiniesta/metainspector/graphs/contributors).

Using an existing gem means I could rely on the gem for unit testing
and worry only about integration testing for the specific use case
described here. See =spec/myscrape_spec.rb= for test cases.

Some of the more recent frameworks can conceal content (such as
images) from scrapers by using Javascript lazy or incremental
page-loading techniques. I've not attempted to deal with these. See
http://brettterpstra.com or https://meta.discourse.org for examples:
images that appear on the page do not appear in the HTML source
retrieved by the scraper.

So, a simple gem that wraps MetaInspector and a command-line
executable in `bin/scrape` that runs the most common case.
