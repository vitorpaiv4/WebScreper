require 'csv'

class DataExporter
  def self.para_csv(dados, nome_arquivo)
    CSV.open(nome_arquivo, 'w') do |csv|
      csv << dados.first.keys # Cabeçalho
      dados.each { |item| csv << item.values }
    end
  end
end