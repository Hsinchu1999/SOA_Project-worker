# frozen_string_literal: true

require 'figaro'
require 'sequel'

module TravellingSuggestions
  # Setup config environment
  class MBTIModelUpdateWorker
    # Environment variables setup
    Figaro.application = Figaro::Application.new(
      environment: ENV['WORKER_ENV'] || 'development',
      path: File.expand_path('config/secrets.yml')
    )
    Figaro.load
    def self.config() = Figaro.env
    ENV['DATABASE_URL'] = "sqlite://#{config.DB_FILENAME}"
    DB = Sequel.connect(ENV.fetch('DATABASE_URL'))
    def self.DB = DB
  end
end
