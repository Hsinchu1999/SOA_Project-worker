# frozen_string_literal: true

require 'dry-types'
require 'dry-struct'

module TravellingSuggestions
  module Entity
    # An Entity object for a single preference
    class Preference < Dry::Struct
      include Dry.Types

      attribute :id,                      Strict::Integer
      attribute :attraction_id,           Strict::Integer
      attribute :enfj_like,               Strict::Integer
      attribute :enfj_dislike,            Strict::Integer
      attribute :enfp_like,               Strict::Integer
      attribute :enfp_dislike,            Strict::Integer
      attribute :entj_like,               Strict::Integer
      attribute :entj_dislike,            Strict::Integer
      attribute :entp_like,               Strict::Integer
      attribute :entp_dislike,            Strict::Integer
      attribute :esfj_like,               Strict::Integer
      attribute :esfj_dislike,            Strict::Integer
      attribute :esfp_like,               Strict::Integer
      attribute :esfp_dislike,            Strict::Integer
      attribute :estj_like,               Strict::Integer
      attribute :estj_dislike,            Strict::Integer
      attribute :estp_like,               Strict::Integer
      attribute :estp_dislike,            Strict::Integer
      attribute :infj_like,               Strict::Integer
      attribute :infj_dislike,            Strict::Integer
      attribute :infp_like,               Strict::Integer
      attribute :infp_dislike,            Strict::Integer
      attribute :intj_like,               Strict::Integer
      attribute :intj_dislike,            Strict::Integer
      attribute :intp_like,               Strict::Integer
      attribute :intp_dislike,            Strict::Integer
      attribute :isfj_like,               Strict::Integer
      attribute :isfj_dislike,            Strict::Integer
      attribute :isfp_like,               Strict::Integer
      attribute :isfp_dislike,            Strict::Integer
      attribute :istj_like,               Strict::Integer
      attribute :istj_dislike,            Strict::Integer
      attribute :istp_like,               Strict::Integer
      attribute :istp_dislike,            Strict::Integer

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
    end
  end
end
