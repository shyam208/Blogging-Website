require 'open-uri'
require 'net/http'

def remote_file_exists?(url)
  url = URI.parse(url)
  Net::HTTP.start(url.host, url.port) do |http|
    return http.head(url.request_uri)['Content-Type'].start_with? 'image'
  end
end
