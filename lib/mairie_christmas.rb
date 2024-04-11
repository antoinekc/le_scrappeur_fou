require "nokogiri"
require "open-uri"

=begin
a = [
  { "ville_1" => "email_1" },
  { "ville_2" => "email_2" }, 
  etc
]
=end

#begin

#url = https://www.aude.fr/annuaire-mairies-du-departement/mairie-aigues-vives

#def get_townhall_email(townhall_url)
  
url = "https://www.aude.fr/annuaire-mairies-du-departement/mairie-aigues-vives"
doc = Nokogiri::HTML(URI.open(url))

  townhalls_infos = {}

  doc.css("div.heading__content").each do | townhall |
    townhall_name = townhall.at(".heading__title").content.strip
    email_link = townhall.at("a[href^='mailto:']").content.strip
    #page.css('div#reference a')
    #townhall_mail = townhall.at("info__items").content.strip
    #result['ta_key'] = 'ta_value'
    townhalls_infos[townhall_name] ||= 0
    townhalls_infos[townhall_name] = email_link

  end

townhalls_infos.each do | townhall_name, townhall_mail |
  puts "#{townhall_name} ==> #{townhall_mail}"

end



doc = Nokogiri::HTML(URI.open("https://www.aude.fr/annuaire-mairies-du-departement"))

mairies_page = doc.xpath("//article[@class='directory-block__item']")

hash = {}

mairies_page.each do |block|
    ville = block.at("h2.directory-block__title").text
    mail = block.at("p.-email a").text
    hash[ville] = mail
end


hash.each do |ville, mail|
  puts "#{ville} => #{mail}"
end

town_urls = []
town_names = []

directory.each do | town |
  town_names = town.at("h2.composite-link__title").text  
  town_url = town.at_("p.-email a").text  #je relance mon ordi car discord marche plus

  town_urls[town_names] = town_url
end

town_urls do |town_names , town_url |
  puts "#{ville} ==> #{town_url}"
end

end

