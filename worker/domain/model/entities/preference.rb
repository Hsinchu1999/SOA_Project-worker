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
        res[:mbti][:enfj] = @enfj_like / (@enfj_like + @enfj_dislike)
        res[:mbti][:enfp] = @enfp_like / (@enfp_like + @enfp_dislike)
        res[:mbti][:entj] = @entj_like / (@entj_like + @entj_dislike)
        res[:mbti][:entp] = @entp_like / (@entp_like + @entp_dislike)
        res[:mbti][:esfj] = @esfj_like / (@esfj_like + @esfj_dislike)
        res[:mbti][:esfp] = @esfp_like / (@esfp_like + @esfp_dislike)
        res[:mbti][:estj] = @estj_like / (@estj_like + @estj_dislike)
        res[:mbti][:estp] = @estp_like / (@estp_like + @estp_dislike)
        res[:mbti][:infj] = @infj_like / (@infj_like + @infj_dislike)
        res[:mbti][:infp] = @infp_like / (@infp_like + @infp_dislike)
        res[:mbti][:intj] = @intj_like / (@intj_like + @intj_dislike)
        res[:mbti][:intp] = @intp_like / (@intp_like + @intp_dislike)
        res[:mbti][:isfj] = @isfj_like / (@isfj_like + @isfj_dislike)
        res[:mbti][:isfp] = @isfp_like / (@isfp_like + @isfp_dislike)
        res[:mbti][:istj] = @istj_like / (@istj_like + @istj_dislike)
        res[:mbti][:istp] = @istp_like / (@istp_like + @istp_dislike)

        res
      end
    end
  end
end
