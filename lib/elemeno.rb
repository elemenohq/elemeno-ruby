require "elemeno/version"
require "faraday"
require "json"

module Elemeno
	class Client

		@@singleBase = 'singles/'
		@@collectionBase = 'collections/'

		def initialize(api_key)
			@conn = Faraday.new(:url => 'https://api.elemeno.io/v1/', :headers => {'Authorization' => api_key}) do |conn|
				conn.use Faraday::Response::RaiseError
				conn.use Faraday::Adapter::NetHttp
			end
		end

		private def get(path, query = nil)
			response = @conn.get do |req|
				req.url path
				if query
					req.params = query
				end
			end

			return JSON.parse(response.body)
		end

		private def getQuery(options = nil, allow = false)
			query = Hash.new

			if options && options.is_a?(Hash)
				if options.has_key?(:filters) && allow.is_a?(Array) && allow.include?('filters')
					query['filters'] = options[:filters].to_json
				end
				if options.has_key?(:sort) && allow.is_a?(Array) && allow.include?('sort')
					query['sort'] = options[:sort].to_json
				end
				if options.has_key?(:page)
					query['page'] = options[:page].to_json
				end
				if options.has_key?(:size)
					query['size'] = options[:size].to_json
				end
				if options.has_key?(:byId)
					query['byId'] = (options[:byId].is_a?(TrueClass) || options[:byId] == 'true') ? true : false
				end
			end

			return query
		end

		def getSingles(options = nil)
			return get(@@singleBase, getQuery(options, ['sort']))
		end

		def getSingle(singleSlug)
			return get(@@singleBase + singleSlug)
		end

		def getCollections(options = nil)
			return get(@@collectionBase, getQuery(options, ['sort']))
		end

		def getCollection(collectionSlug)
			return get(@@collectionBase + collectionSlug)
		end

		def getCollectionItems(collectionSlug, options = nil)
			return get(@@collectionBase + collectionSlug + '/items', getQuery(options, ['filters', 'sort']))
		end

		def getCollectionItem(collectionSlug, itemSlug, options = nil)
			return get(@@collectionBase + collectionSlug + '/items/' + itemSlug, getQuery(options, ['sort']))
		end
	end
end
