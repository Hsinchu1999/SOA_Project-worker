# frozen_string_literal: true

require_relative 'models'
require_relative 'preferences'

module TravellingSuggestions
  module Repository
    # A For object for Attraction root aggregate
    module ForPreferences
      ENTITY_REPOSITORY = {
        Entity::Model => Models,
        Entity::Preference => Preferences
      }.freeze

      def self.klass(entity_klass)
        ENTITY_REPOSITORY[entity_klass]
      end

      def self.entity(entity_object)
        ENTITY_REPOSITORY[entity_object.class]
      end
    end
  end
end
