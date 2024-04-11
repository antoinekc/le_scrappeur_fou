
#OBJECTIF :récupérer le cours de toutes les cryptomonnaies du marché.

require "nokogiri"
require "open-uri"

#url = gets.chomp()
#crypto_scraper(url)

#def cryptoscrapper(url)
  begin
    
    doc = Nokogiri::HTML(URI.open("https://coinmarketcap.com/all/views/all/"))

    cryptos = {}

    doc.css("tr.cmc-table-row").each do |crypto|
      #crypto_symbol = crypto.at_css(".cmc-table__cell.cmc-table__cell--sortable.cmc-table__cell--left.cmc-table__cell--hide-sm.cmc-table__cell--sort-by__symbol").content.strip
      crypto_symbol = crypto.at(".cmc-table__cell--sort-by__symbol").content
      crypto_value = crypto.at(".cmc-table__cell--sort-by__price").content

      #result['ta_key'] = 'ta_value'
      cryptos[crypto_symbol] ||= 0
      cryptos[crypto_symbol] = crypto_value

      #puts "#{crypto_symbol}: #{crypto_value} "
    end
    
  rescue NoMethodError
    puts "--no more content"
  end

  cryptos.each do |crypto_symbol, crypto_value|
    prints "#{crypto_symbol} ==> #{crypto_value} "
  end

#end

