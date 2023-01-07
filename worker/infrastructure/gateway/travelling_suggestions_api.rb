# frozen_string_literal: true

require 'http'

module TravellingSuggestions
  module Gateway
    # Infrastructure to call TravellingSuggestions API
    class Api
      def initialize(config)
        @config = config
        @request = Request.new(@config)
      end

      def alive?
        @request.get_root.success?
      end

      def update_model(attraction_id, preferences)
        @request.update_model(attraction_id, preferences)
      end

      # HTTP request transmitter
      class Request
        def initialize(config)
          @api_host = config.API_HOST
          @api_root = "#{config.API_HOST}/api/v1"
        end

        def get_root
          call_api_get
        end

        def update_model(attraction_id, preferences)
          params = preferences
          params['attraction_id'] = attraction_id
          call_api_get(%w[model update], params)
        end


        private

        def call_api_get(resources = [], params = {})
          api_path = resources.empty? ? @api_host : @api_root
          url = [api_path, resources].flatten.join('/')
          unless params.empty?
            url += '?'
            params.each do |key, value|
              url += "#{key}=#{value}&"
            end
          end
          url = url.delete_suffix('&')
          HTTP.get(url).then { |http_response| Response.new(http_response) }
        rescue StandardError
          puts "HTTP request failed, url = #{url}"
        end

        def call_api_post(resources = [], params = {})
          api_path = resources.empty? ? @api_host : @api_root
          url = [api_path, resources].flatten.join('/')
          unless params.empty?
            url += '?'
            params.each do |key, value|
              url += "#{key}=#{value}&"
            end
          end
          url = url.delete_suffix('&')
          HTTP.post(url).then { |http_response| Response.new(http_response) }
        rescue StandardError
          puts "HTTP request failed, url = #{url}"
        end

        # Decorates HTTP responses with success/error
        class Response < SimpleDelegator
          NotFound = Class.new(StandardError)

          SUCCESS_CODES = (200..299)
          CONFLICT_CODE = 409
          NOTFOUND_CODE = 404

          def success?
            code.between?(SUCCESS_CODES.first, SUCCESS_CODES.last)
          end

          def conflict?
            code == CONFLICT_CODE
          end

          def not_found?
            code == NOTFOUND_CODE
          end

          def message
            payload['message']
          end

          def payload
            body.to_s
          end
        end
      end
    end
  end
end
