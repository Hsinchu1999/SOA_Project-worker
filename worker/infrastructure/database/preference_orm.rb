# frozen_string_literal: true

require 'sequel'

module TravellingSuggestions
  module Database
    class PreferenceOrm < Sequel::Model(:preferences)
      plugin :timestamps, update_on_create: true
    
    def self.find_or_create(preference_info)
      first(attraction_id: preference_info[:attraction_id]) || create(attraction_id: preference_info[:attraction_id],
      enfj_like=0,
      enfj_dislike=0,
      enfp_like=0,
      enfp_dislike=0,
      entj_like=0,
      entj_dislike=0,
      entp_like=0,
      entp_dislike=0,
      esfj_like=0,
      esfj_dislike=0,
      esfp_like=0,
      esfp_dislike=0,
      estj_like=0,
      estj_dislike=0,
      estp_like=0,
      estp_dislike=0,
      infj_like=0,
      infj_dislike=0,
      infp_like=0,
      infp_dislike=0,
      intj_like=0,
      intj_dislike=0,
      intp_like=0,
      intp_dislike=0,
      isfj_like=0,
      isfj_dislike=0,
      isfp_like=0,
      isfp_dislike=0,
      istj_like=0,
      istj_dislike=0,
      istp_like=0,
      istp_dislike=0)
    end
    end
  end
end
