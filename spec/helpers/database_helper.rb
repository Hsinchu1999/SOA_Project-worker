# frozen_string_literal: true

# Helper to wipe database
module DatabaseHelper
  def self.wipe_database
    TravellingSuggestions::App.DB.run('PRAGMA foreign_keys = OFF')
    TravellingSuggestions::Database::PreferenceOrm.map(&:destroy)
    TravellingSuggestions::App.DB.run('PRAGMA foreign_keys = ON')
  end
end
  