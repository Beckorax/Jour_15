

class Scrapper


  def initialize
    @array_townhall_urls = Array.new
  end

    def get_townhall_email(townhall_url)
    page = Nokogiri::HTML(open("http://annuaire-des-mairies.com#{townhall_url[1..-1]}"))
    email = page.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').text # Fonctionne
    town_name = townhall_url[5..-6]
    { town_name => email }
  end

  def get_townhall_urls
    page = Nokogiri::HTML(open('http://annuaire-des-mairies.com/val-d-oise.html'))
    page.xpath("//a[@class='lientxt']/@href")
  end

  def perform
    # Pour chaque ville
    array_url_name = get_townhall_urls
    array_url_name.each do |url|
      @array_townhall_urls << get_townhall_email(url.text)
    end
    @array_townhall_urls
  end

  def save_as_JSON
    # json = JSON.stringify(@array_townhall_urls)
    File.open("db/emails.json", "w") do |f|
      f.write(@array_townhall_urls.to_json)
    end
  end
end