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

  it 'scrapes stanfordhealthcare root' do
    scraper = Myscrape::Scraper.new('https://stanfordhealthcare.org')
    expect(scraper.summary).to eq(
                                   {
                                     url: "https://stanfordhealthcare.org/",
                                     links: [
                                       "/for-patients-visitors/locations-and-parking.html",
                                       "/for-patients-visitors/visiting-hours.html",
                                       "/for-patients-visitors/your-hospital-stay.html",
                                       "/for-patients-visitors/international-services.html",
                                       "/for-patients-visitors/billing.html",
                                       "/for-patients-visitors/support-groups.html",
                                       "/for-patients-visitors.html",
                                       "/health-care-professionals/referring-physicians.html",
                                       "/health-care-professionals/nursing.html",
                                       "/health-care-professionals/allied-healthcare.html",
                                       "/health-care-professionals.html",
                                       "/health-care-professionals/referring-physicians/prism.html",
                                       "/campaigns/stroke-neuroimaging.html",
                                       "/medical-clinics/primary-care.html",
                                       "/campaigns/breast-cancer-awareness-month.html",
                                       "/campaigns/atrial-fibrillation-firm.html",
                                       "/medical-clinics/cardiac-arrhythmia-service.html",
                                       "/stanford-health-now/videos/new-mapping-technology-target-afib.html",
                                       "/campaigns/stanford-cancer-center-south-bay-open.html",
                                       "/medical-clinics/south-bay-cancer-center.html",
                                       "/newsroom/articles/2015/shc-completes-sccsb.html",
                                       "/campaigns/select-your-doctor.html",
                                       "/search-results.conditions.html",
                                       "/search-results.clinics.html",
                                       "/search-results.doctors.html",
                                       "/stanford-health-now.html",
                                       "/stanford-health-now.html/.html",
                                       "/newsroom/articles/2015/shc-ranks-among-nations-most-connected-hospitals.html",
                                       "/newsroom/articles/2015/stanford-health-care-ceo-step-down-2015.html",
                                       "/stanfordhealthcare.html/",
                                       "/for-patients-visitors/volunteering.html",
                                       "/about-us.html",
                                       "/newsroom.html",
                                       "/about-us/legal-disclaimer.html",
                                       "/for-patients-visitors/your-hospital-stay/patient-privacy.html",
                                       "/about-us/conduct.html",
                                       "/newsroom/listings.html"
                                     ],
                                     assets: [
                                       "https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700",
                                       "https://stanfordhealthcare.org/etc/clientlibs/shc/aem-optimized.min.d41d8cd98f00b204e9800998ecf8427e.css",
                                       "https://stanfordhealthcare.org/etc/clientlibs/shc/main.min.3274a7e36c0638a5538029f859174615.css",
                                       "https://stanfordhealthcare.org/etc/clientlibs/shc/aggregate.megasearch.min.css",
                                       "https://stanfordhealthcare.org/etc/clientlibs/shc/aggregateapps.min.eadfbc1ae9128b5d281297224fc85cc9.css",
                                       "https://stanfordhealthcare.org/etc/clientlibs/shc/main/img/logo-shc.png",
                                       "https://stanfordhealthcare.org/content/dam/SHC/Campaign/stroke-neuroimaging/images/stroke-721-444-tm.jpg.transform/721x444/q82/image.jpg",
                                       "https://stanfordhealthcare.org/content/dam/SHC/Campaign/breast-cancer-awareness/bca-ribbon.jpg.transform/221x221/q82/image.jpg",
                                       "https://stanfordhealthcare.org/content/dam/SHC/Campaign/Atrial-Fibrillation/images/narayan-721-444-tm.jpg.transform/721x444/q82/image.jpg",
                                       "https://stanfordhealthcare.org/content/dam/SHC/clinics/locations/300pasteurdr-stanford.jpg.transform/221x221/q82/image.jpg",
                                       "https://img.youtube.com/vi/1r5nx-cav3o/maxresdefault.jpg",
                                       "https://stanfordhealthcare.org/content/dam/SHC/Campaign/sccsb/sccsb-crawford-homepage.jpg.transform/721x444/q82/image.jpg",
                                       "https://stanfordhealthcare.org/content/dam/SHC/Campaign/sccsb/sccsb-new-building.jpg.transform/221x221/q82/image.jpg",
                                       "https://stanfordhealthcare.org/content/shc/en/newsroom/articles/2015/shc-completes-sccsb/_jcr_content/squareThumbnail.transform/221x221/q82/image.jpg",
                                       "https://stanfordhealthcare.org/content/dam/SHC/health-care-professionals/healthcareprofessionals-photo-mdstethoscope.jpg.transform/original/q82/image.jpg",
                                       "https://stanfordhealthcare.org/content/shc/en/newsroom/articles/2015/shc-ranks-among-nations-most-connected-hospitals/_jcr_content/squareThumbnail.transform/100x100/q82/image.jpg",
                                       "https://stanfordhealthcare.org/content/shc/en/_jcr_content/home-main-parsys/general_container_0/parsyscontainer/content_box/personImage1.transform/original/q82/image.png",
                                       "https://stanfordhealthcare.org/content/shc/en/_jcr_content/home-main-parsys/mvp_promotion/desktopImage.transform/300x260/q82/image.jpg",
                                       "https://stanfordhealthcare.org/content/shc/en/_jcr_content/home-main-parsys/mvp_promotion/desktopImage2.transform/300x260/q82/image.jpg",
                                       "https://stanfordhealthcare.org/content/shc/en/_jcr_content/home-main-parsys/mvp_promotion/desktopImage3.transform/300x260/q82/image.jpg"
                                     ]
                                   }
                               )
  end
end
