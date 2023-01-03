# frozen_string_literal: true

module TravellingSuggestions
  module Repository
    # A Repository object for Entity::User objects
    class Preferences
      def self.find_id(id)
        rebuild_entity Database::PreferenceOrm.first(id:)
      end

      def self.find_attraction_id(attraction_id)
        rebuild_entity Database::PreferenceOrm.first(attraction_id:)
      end

      def self.rebuild_entity(db_record)
        return nil unless db_record

        Entity::Preference.new(
          id: db_record.id,
          attraction_id: db_record.nickname,
          enfj_like: db_record.enfj_like,
          enfj_dislike: db_record.enfj_dislike,
          enfp_like: db_record.enfp_like,
          enfp_dislike: db_record.enfp_dislike,
          entj_like: db_record.entj_like,
          entj_dislike: db_record.entj_dislike,
          entp_like: db_record.entp_like,
          entp_dislike: db_record.entp_dislike,
          esfj_like: db_record.esfj_like,
          esfj_dislike: db_record.esfj_dislike,
          esfp_like: db_record.esfp_like,
          esfp_dislike: db_record.esfp_dislike,
          estj_like: db_record.estj_like,
          estj_dislike: db_record.estj_dislike,
          estp_like: db_record.estp_like,
          estp_dislike: db_record.estp_dislike,
          infj_like: db_record.infj_like,
          infj_dislike: db_record.infj_dislike,
          infp_like: db_record.infp_like,
          infp_dislike: db_record.infp_dislike,
          intj_like: db_record.intj_like,
          intj_dislike: db_record.intj_dislike,
          intp_like: db_record.intp_like,
          intp_dislike: db_record.intp_dislike,
          isfj_like: db_record.isfj_like,
          isfj_dislike: db_record.isfj_dislike,
          isfp_like: db_record.isfp_like,
          isfp_dislike: db_record.isfp_dislike,
          istj_like: db_record.istj_like,
          istj_dislike: db_record.istj_dislike,
          istp_like: db_record.istp_like,
          istp_dislike: db_record.istp_dislike
        )
      end

      def self.rebuild_many_entities(db_records)
        db_records.map do |db_member|
          Preferences.rebuild_entity(db_member)
        end
      end

      def self.db_create(nickname, mbti)
        Database::PreferenceOrm.create(
          attraction_id:,
          enfj_like:,
          enfj_dislike:,
          enfp_like:,
          enfp_dislike:,
          entj_like:,
          entj_dislike:,
          entp_like:,
          entp_dislike:,
          esfj_like:,
          esfj_dislike:,
          esfp_like:,
          esfp_dislike:,
          estj_like:,
          estj_dislike:,
          estp_like:,
          estp_dislike:,
          infj_like:,
          infj_dislike:,
          infp_like:,
          infp_dislike:,
          intj_like:,
          intj_dislike:,
          intp_like:,
          intp_dislike:,
          isfj_like:,
          isfj_dislike:,
          isfp_like:,
          isfp_dislike:,
          istj_like:,
          istj_dislike:,
          istp_like:,
          istp_disliked:
        )
      end

  end
end
