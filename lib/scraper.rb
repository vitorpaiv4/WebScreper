require 'httparty'
require 'nokogiri'

class Scraper
  def initialize(url)
    @url = url
  end

  def extrair_dados
    response = HTTParty.get(@url)
    return nil if response.code != 200 # Retorna nil se a resposta não for 200

    doc = Nokogiri::HTML(response.body)
    # Sua lógica de extração aqui
  end
end