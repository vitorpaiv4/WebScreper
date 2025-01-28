# Web Scraper em Ruby 🕷️

Um scraper modular para extrair dados de sites, desenvolvido em Ruby com HTTParty e Nokogiri.  
**Funcionalidades**: requisições HTTP, extração de dados via seletores CSS, exportação para CSV e logs detalhados.

---

## 🚀 Como Usar

### Pré-requisitos
- Ruby 3.0+ instalado
- Gerenciador de gems (Bundler recomendado)

### Instalação
1. Clone o repositório:
   ```bash
   git clone https://github.com/seu-usuario/web-scraper-ruby.git
   cd web-scraper-ruby
   ```
2. Instale as dependências:
   ```bash
   bundle install
   ```

📋 **Configuração**  
Arquivo `config/config.yml`  
Configure URLs e seletores CSS:
```yaml
urls:
  - https://exemplo.com/produtos
  - https://exemplo.com/blog

selectors:
  produto: '.produto'       # Container de cada item
  nome: '.nome-produto'     # Nome do produto
  preco: '.preco'           # Preço
  link: 'a[href]'           # Link do produto

settings:
  user_agent: "Mozilla/5.0 (Ruby Scraper)"
  delay: 2                  # Delay entre requisições (segundos)
```

▶️ **Execução**  
**Scraping Básico**  
```bash
ruby run.rb
```
Os dados serão salvos em `data/produtos.csv`.

**Testes (RSpec)**  
```bash
rspec spec/
```

🗂️ **Estrutura do Projeto**
```
web-scraper-ruby/
├── lib/                  # Código-fonte
│   ├── scraper.rb        # Lógica principal do scraping
│   ├── data_exporter.rb  # Exportação para CSV/JSON
│   └── utils.rb          # Utilitários (logs, headers)
├── config/
│   └── config.yml        # Configurações do site
├── spec/                 # Testes
│   ├── scraper_spec.rb
│   └── fixtures/         # HTMLs mockados para testes
├── data/                 # Dados extraídos (CSV/JSON)
├── logs/                 # Logs de execução
├── run.rb                # Script de execução
├── Gemfile               # Dependências
└── README.md
```

🔧 **Dependências Principais**
- HTTParty: Requisições HTTP.
- Nokogiri: Parseamento de HTML/XML.
- RSpec: Testes unitários.
- WebMock: Mock de requisições HTTP.

Lista completa em `Gemfile`.

⚠️ **Boas Práticas**
- Respeite o `robots.txt` do site alvo.
- Adicione delay entre requisições para evitar bloqueios.
- Use headers personalizados (ex: User-Agent) para simular navegadores reais.
- Para sites com JavaScript, substitua HTTParty por Ferrum ou Selenium.

📄 **Exemplo de Código (scraper.rb)**
```ruby
require 'httparty'
require 'yaml'

class Scraper
  def initialize
    config = YAML.load_file('config/config.yml')
    @url = config['urls'].first
    @selectors = config['selectors']
  end

  def scrape
    response = HTTParty.get(@url, headers: { "User-Agent" => "Scraper" })
    doc = Nokogiri::HTML(response.body)
    
    doc.css(@selectors['produto']).map do |produto|
      {
        nome: produto.css(@selectors['nome']).text.strip,
        preco: produto.css(@selectors['preco']).text.strip,
        link: produto.css(@selectors['link']).first['href']
      }
    end
  end
end
```

🤝 **Como Contribuir**
- Faça um fork do projeto.
- Crie uma branch (git checkout -b feature/nova-funcionalidade).
- Commit suas mudanças (git commit -m 'Adiciona nova funcionalidade').
- Push para a branch (git push origin feature/nova-funcionalidade).
- Abra um Pull Request.

📝 **Licença**
Distribuído sob a licença MIT. Veja LICENSE para mais detalhes.

Nota: Use este projeto apenas em sites que permitam scraping e para fins éticos. 🟢

---

### **Personalização:**
- Substitua `https://exemplo.com` pela URL do seu site alvo.
- Ajuste os seletores CSS em `config.yml` conforme a estrutura do site.
- Adicione mais funcionalidades (ex: autenticação, paginação) conforme necessário.
