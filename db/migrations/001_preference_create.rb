# frozen_string_literal: true

require 'sequel'

Sequel.migration do
  change do
    create_table(:preference) do
      primary_key :id

      Integer :attraction_id, null: false
      Integer :enfj_like, null: false
      Integer :enfj_dislike, null: false
      Integer :enfp_like, null: false
      Integer :enfp_dislike, null: false
      Integer :entj_like, null: false
      Integer :entj_dislike, null: false
      Integer :entp_like, null: false
      Integer :entp_dislike, null: false
      Integer :esfj_like, null: false
      Integer :esfj_dislike, null: false
      Integer :esfp_like, null: false
      Integer :esfp_dislike, null: false
      Integer :estj_like, null: false
      Integer :estj_dislike, null: false
      Integer :estp_like, null: false
      Integer :estp_dislike, null: false
      Integer :infj_like, null: false
      Integer :infj_dislike, null: false
      Integer :infp_like, null: false
      Integer :infp_dislike, null: false
      Integer :intj_like, null: false
      Integer :intj_dislike, null: false
      Integer :intp_like, null: false
      Integer :intp_dislike, null: false
      Integer :isfj_like, null: false
      Integer :isfj_dislike, null: false
      Integer :isfp_like, null: false
      Integer :isfp_dislike, null: false
      Integer :istj_like, null: false
      Integer :istj_dislike, null: false
      Integer :istp_like, null: false
      Integer :istp_dislike, null: false

      DateTime :created_at
      DateTime :updated_at
    end
  end
end
