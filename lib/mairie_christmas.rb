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


#result['ta_key'] = 'ta_value'

=begin
faire un array avec le noms des villes
faire un array avec les emails
=end
