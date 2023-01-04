# frozen_string_literal: true

module TravellingSuggestions
  module Repository
    # A Repository object for Entity::User objects
    class Models
      def self.load_all()
        rebuild_entity
      end

      def self.rebuild_entity()

        preferences = Repository::Preferences.find_all()
        puts 'in Models.rebuild_entity'
        puts preferences
        puts preferences.class

        Entity::Model.new(
          preferences
        )
      end

      # def self.rebuild_many_entities(db_records)
      #   db_records.map do |db_member|
      #     Models.rebuild_entity(db_member)
      #   end
      # end

      def self.db_find_or_create(_entity)
        nil
      end

      # def self.db_create(nickname, mbti)
      #   Database::UserOrm.create(nickname:, mbti:)
      # end
      # to be completed
    end
  end
end
  