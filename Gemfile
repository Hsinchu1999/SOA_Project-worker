# frozen_string_literal: true

source 'https://rubygems.org'
ruby File.read('.ruby-version').strip

# Configuration
gem 'figaro', '~> 1.2'

# Messaging
gem 'aws-sdk-sqs', '~> 1.48'

# Representers
gem 'multi_json'
gem 'roar'

# Database
gem 'hirb', '~> 0'
gem 'hirb-unicode', '~> 0'
gem 'sequel', '~> 5.49'
group :development, :test do
  gem 'sqlite3'
end
group :production do
  gem 'pg'
end