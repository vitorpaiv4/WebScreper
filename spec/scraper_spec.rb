# spec/scraper_spec.rb
require_relative '../lib/scraper'
require 'webmock/rspec' # Para simular requisições HTTP (opcional)

RSpec.describe Scraper do
  let(:url) { 'https://exemplo.com' }
  subject { described_class.new(url) }

  # Testa se o scraper é inicializado corretamente
  describe '#initialize' do
    it 'inicializa com a URL correta' do
      expect(subject.instance_variable_get(:@url)).to eq(url)
    end
  end

  # Testa a extração de dados
  describe '#extrair_dados' do
    context 'quando a página é válida' do
      before do
        # Mock da resposta HTTP (simula o HTML retornado)
        html_content = File.read('spec/fixtures/exemplo.html')
        stub_request(:get, url).to_return(body: html_content, status: 200)
      end

      it 'retorna dados extraídos' do
        dados = subject.extrair_dados
        expect(dados).to be_an(Array)
        expect(dados.first[:nome]).to eq('Camiseta Básica')
      end
    end

    context 'quando a página retorna erro' do
      before do
        stub_request(:get, url).to_return(status: 404)
      end

      it 'retorna nil' do
        expect(subject.extrair_dados).to be_nil
      end
    end
  end
end