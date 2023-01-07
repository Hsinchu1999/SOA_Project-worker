# frozen_string_literal: true

require 'roda'
require 'figaro'
require 'sequel'

module TravellingSuggestions
  # Setup config environment
  class MBTIModelUpdateWorker < Roda
    # Environment variables setup
    plugin :environments

    Figaro.application = Figaro::Application.new(
      environment: ENV['WORKER_ENV'] || 'development',
      path: File.expand_path('config/secrets.yml')
    )
    Figaro.load
    def self.config() = Figaro.env
    configure :development, :test do
      ENV['DATABASE_URL'] = "sqlite://#{config.DB_FILENAME}"
    end
    DB = Sequel.connect(ENV.fetch('DATABASE_URL'))
    def self.DB = DB
  end
end
