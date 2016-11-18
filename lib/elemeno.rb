require "elemeno/version"
require "faraday"

module Elemeno
	class Client

		def initialize(api_key)
			@conn = Faraday.new :url => 'http://api.elemeno.io/v1/', :headers => {'Authorization' => api_key}
		end

		def hello
			puts @api_key
			puts Faraday::VERSION
			puts Faraday::default_adapter


			response = @conn.get 'singles'
			puts response.status
			puts response.body
		end

	end
end
