# frozen_string_literal: true

require 'dry-types'
require 'dry-struct'

module TravellingSuggestions
  module Entity
    # An Entity object for a single preference
    class Preference < Dry::Struct
      include Dry.Types
      attr_accessor :enfj_like

      attribute :id,                      Integer.optional
      attribute :attraction_id,           Strict::Integer
      attribute :enfj_like,               Integer.optional
      attribute :enfj_dislike,            Integer.optional
      attribute :enfp_like,               Integer.optional
      attribute :enfp_dislike,            Integer.optional
      attribute :entj_like,               Integer.optional
      attribute :entj_dislike,            Integer.optional
      attribute :entp_like,               Integer.optional
      attribute :entp_dislike,            Integer.optional
      attribute :esfj_like,               Integer.optional
      attribute :esfj_dislike,            Integer.optional
      attribute :esfp_like,               Integer.optional
      attribute :esfp_dislike,            Integer.optional
      attribute :estj_like,               Integer.optional
      attribute :estj_dislike,            Integer.optional
      attribute :estp_like,               Integer.optional
      attribute :estp_dislike,            Integer.optional
      attribute :infj_like,               Integer.optional
      attribute :infj_dislike,            Integer.optional
      attribute :infp_like,               Integer.optional
      attribute :infp_dislike,            Integer.optional
      attribute :intj_like,               Integer.optional
      attribute :intj_dislike,            Integer.optional
      attribute :intp_like,               Integer.optional
      attribute :intp_dislike,            Integer.optional
      attribute :isfj_like,               Integer.optional
      attribute :isfj_dislike,            Integer.optional
      attribute :isfp_like,               Integer.optional
      attribute :isfp_dislike,            Integer.optional
      attribute :istj_like,               Integer.optional
      attribute :istj_dislike,            Integer.optional
      attribute :istp_like,               Integer.optional
      attribute :istp_dislike,            Integer.optional

      def brief
        res = {}
        res[:attraction_id] = @attraction_id
        res[:mbti] = {}
        res[:mbti][:enfj] = @attributes[:enfj_like].to_f / (@attributes[:enfj_like] + @attributes[:enfj_dislike])
        res[:mbti][:enfj] = @attributes[:enfp_like].to_f / (@attributes[:enfp_like] + @attributes[:enfp_dislike])
        res[:mbti][:entj] = @attributes[:entj_like].to_f / (@attributes[:entj_like] + @attributes[:entj_dislike])
        res[:mbti][:entp] = @attributes[:entp_like].to_f / (@attributes[:entp_like] + @attributes[:entp_dislike])
        res[:mbti][:esfj] = @attributes[:esfj_like].to_f / (@attributes[:esfj_like] + @attributes[:esfj_dislike])
        res[:mbti][:esfp] = @attributes[:esfp_like].to_f / (@attributes[:esfp_like] + @attributes[:esfp_dislike])
        res[:mbti][:estj] = @attributes[:estj_like].to_f / (@attributes[:estj_like] + @attributes[:estj_dislike])
        res[:mbti][:estp] = @attributes[:estp_like].to_f / (@attributes[:estp_like] + @attributes[:estp_dislike])
        res[:mbti][:infj] = @attributes[:infj_like].to_f / (@attributes[:infj_like] + @attributes[:infj_dislike])
        res[:mbti][:infp] = @attributes[:infp_like].to_f / (@attributes[:infp_like] + @attributes[:infp_dislike])
        res[:mbti][:intj] = @attributes[:intj_like].to_f / (@attributes[:intj_like] + @attributes[:intj_dislike])
        res[:mbti][:intp] = @attributes[:intp_like].to_f / (@attributes[:intp_like] + @attributes[:intp_dislike])
        res[:mbti][:isfj] = @attributes[:isfj_like].to_f / (@attributes[:isfj_like] + @attributes[:isfj_dislike])
        res[:mbti][:isfp] = @attributes[:isfp_like].to_f / (@attributes[:isfp_like] + @attributes[:isfp_dislike])
        res[:mbti][:istj] = @attributes[:istj_like].to_f / (@attributes[:istj_like] + @attributes[:istj_dislike])
        res[:mbti][:istp] = @attributes[:istp_like].to_f / (@attributes[:istp_like] + @attributes[:istp_dislike])

        res
      end
      def to_attr_hash
        to_hash.except(:id)
      end
    end
  end
end
