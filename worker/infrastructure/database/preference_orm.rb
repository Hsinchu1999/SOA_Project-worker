# frozen_string_literal: true

require 'sequel'

module TravellingSuggestions
  module Database
    class PreferenceOrm < Sequel::Model(:preferences)
      plugin :timestamps, update_on_create: true
    end
  end
end
