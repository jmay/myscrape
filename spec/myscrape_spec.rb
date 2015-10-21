require 'spec_helper'

describe Myscrape do
  it 'has a version number' do
    expect(Myscrape::VERSION).not_to be nil
  end

  it 'scrapes opusforwork.com root' do
    scraper = Myscrape::Scraper.new('https://www.opusforwork.com/')
    expect(scraper.summary).to eq({
                                    url: 'https://www.opusforwork.com/',
                                    links: [
                                      "/js/opus.js",
                                      "/index.html",
                                      "/about/",
                                      "/faq/",
                                      "/browse/"
                                    ],
                                    assets: [
                                      "https://www.opusforwork.com/css/main.css"
                                    ]
                                  })
  end

  it 'scrapes opusforwork.com links' do
    scraper = Myscrape::Scraper.new('https://www.opusforwork.com/')
    expect(scraper.subscrape).to eq([
                                      {
                                        url: "https://www.opusforwork.com/js/opus.js",
                                        links: [],
                                        assets: []
                                      },
                                      {
                                        url: "https://www.opusforwork.com/index.html",
                                        links: [
                                          "/js/opus.js",
                                          "/about/",
                                          "/faq/",
                                          "/browse/"
                                        ],
                                        assets: [
                                          "https://www.opusforwork.com/css/main.css"
                                        ]
                                      },
                                      {
                                        url: "https://www.opusforwork.com/about/",
                                        links: [
                                          "/",
                                          "/js/opus.js",
                                          "/index.html",
                                          "/faq/",
                                          "/browse/"
                                        ],
                                        assets: [
                                          "https://www.opusforwork.com/css/main.css"
                                        ]
                                      }                                    ])
  end

end
