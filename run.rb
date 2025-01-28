require_relative 'scraper'
require_relative 'data_exporter'

scraper = Scraper.new('https://exemplo.com')
dados = scraper.extrair_dados
DataExporter.para_csv(dados, 'dados.csv')