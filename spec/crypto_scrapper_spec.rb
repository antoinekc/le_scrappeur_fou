require_relative '/Users/antoine/THP/week3/crypto_scrapper/lib/crypto_scraper.rb'


describe "the crypto scrapper function will test if the scrapper is functionnal. " do
  it "needs to check if one cryptocurrency is in the array " do
    
    cryptocurrencies_to_check = ["BTC", "ETH", "SOL", "XRP", "USDC"]

     # Get an array of symbols from cryptos_hash
    symbols_in_array = cryptos_hash.map { |crypto| crypto[:symbol] }

    expect(symbols_in_array).to include(*cryptocurrencies_to_check)

  end

    it "needs to check that the size of the array is at least 10" do
      expect(cryptos.length).to be >10
    end
    
end