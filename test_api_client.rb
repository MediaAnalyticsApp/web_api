require 'oj'
require 'faraday'
 
client = Faraday.new(url: 'http://localhost:3000') do |config|
  config.adapter  Faraday.default_adapter
  config.token_auth('9726c7ae131453c18b5a0bd8a39b8060')
end
 
# response = client.post do |req|
#   req.url '/api/v1/pages'
#   req.headers['Content-Type'] = 'application/json'
#   req.body = '{ "site": {"name": "Lenta.ru"} }'
# end

# response = client.put do |req|
#   req.url '/api/v1/sites/1.json'
#   req.headers['Content-Type'] = 'application/json'
#   req.body = '{ "site": {"name": "lentach.ru"} }'
# end

response = client.get do |req|
  req.url '/api/v1/pages.json'
  req.headers['Content-Type'] = 'application/json'
end

# response = client.delete do |req|
#   req.url '/api/v1/sites/1.json'
#   req.headers['Content-Type'] = 'application/json'
# end


puts Oj.load(response.body)
puts response.status