require 'mechanize'

namespace :scraping do
  desc "Scraping beer names to create catalog in db"
  task beers: :environment do
    agent = Mechanize.new
    page = agent.get('https://listas.20minutos.es/lista/las-30-mejores-cervezas-mexicanas-403674/')
    beer_div = page.search('.//div[@class="listas_elementos"]/div/div/h3')
    beer_div.each do |tag|
      Beer.create(name: tag.text)
    end
  end
end
