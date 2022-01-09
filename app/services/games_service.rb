class GamesService
  class << self
    def get_url(url)
      parse_data(conn.get(url))
    end

    def trivia
      get_url("api.php?amount=500&category=29&type=multiple")
    end

    def conn
      Faraday.new("https://opentdb.com/")
    end

    def parse_data(response)
      parsed = JSON.parse(response.body, symbolize_names: true)
    end
  end
end
