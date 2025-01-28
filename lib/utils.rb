module Utils
    def self.headers
      {
        "User-Agent" => "Mozilla/5.0 (Ruby Scraper)",
        "Accept-Language" => "pt-BR"
      }
    end
  
    def self.delay
      sleep(rand(1..3)) # Espera entre 1 e 3 segundos
    end
  end