# frozen_string_literal: true

require 'sequel'

module TravellingSuggestions
  module Database
    class PreferenceOrm < Sequel::Model(:preferences)
      plugin :timestamps, update_on_create: true

      def self.find_or_create(preference_info)
        first(attraction_id: preference_info[:attraction_id]) || create(attraction_id: preference_info[:attraction_id], enfj_like: 0,
                                                                        enfj_dislike: 1,
                                                                        enfp_like: 1,
                                                                        enfp_dislike: 1,
                                                                        entj_like: 1,
                                                                        entj_dislike: 1,
                                                                        entp_like: 1,
                                                                        entp_dislike: 1,
                                                                        esfj_like: 1,
                                                                        esfj_dislike: 1,
                                                                        esfp_like: 1,
                                                                        esfp_dislike: 1,
                                                                        estj_like: 1,
                                                                        estj_dislike: 1,
                                                                        estp_like: 1,
                                                                        estp_dislike: 1,
                                                                        infj_like: 1,
                                                                        infj_dislike: 1,
                                                                        infp_like: 1,
                                                                        infp_dislike: 1,
                                                                        intj_like: 1,
                                                                        intj_dislike: 1,
                                                                        intp_like: 1,
                                                                        intp_dislike: 1,
                                                                        isfj_like: 1,
                                                                        isfj_dislike: 1,
                                                                        isfp_like: 1,
                                                                        isfp_dislike: 1,
                                                                        istj_like: 1,
                                                                        istj_dislike: 1,
                                                                        istp_like: 1,
                                                                        istp_dislike: 1)
      end
    end
  end
end
