# frozen_string_literal: true

require 'sequel'

Sequel.migration do
  change do
    create_table(:preferences) do
      primary_key :id

      Integer :attraction_id, null: false
      Integer :enfj_like, default:0, null: false
      Integer :enfj_dislike, default:0, null: false
      Integer :enfp_like, default:0, null: false
      Integer :enfp_dislike, default:0, null: false
      Integer :entj_like, default:0, null: false
      Integer :entj_dislike, default:0, null: false
      Integer :entp_like, default:0, null: false
      Integer :entp_dislike, default:0, null: false
      Integer :esfj_like, default:0, null: false
      Integer :esfj_dislike, default:0, null: false
      Integer :esfp_like, default:0, null: false
      Integer :esfp_dislike, default:0, null: false
      Integer :estj_like, default:0, null: false
      Integer :estj_dislike, default:0, null: false
      Integer :estp_like, default:0, null: false
      Integer :estp_dislike, default:0, null: false
      Integer :infj_like, default:0, null: false
      Integer :infj_dislike, default:0, null: false
      Integer :infp_like, default:0, null: false
      Integer :infp_dislike, default:0, null: false
      Integer :intj_like, default:0, null: false
      Integer :intj_dislike, default:0, null: false
      Integer :intp_like, default:0, null: false
      Integer :intp_dislike, default:0, null: false
      Integer :isfj_like, default:0, null: false
      Integer :isfj_dislike, default:0, null: false
      Integer :isfp_like, default:0, null: false
      Integer :isfp_dislike, default:0, null: false
      Integer :istj_like, default:0, null: false
      Integer :istj_dislike, default:0, null: false
      Integer :istp_like, default:0, null: false
      Integer :istp_dislike, default:0, null: false

      DateTime :created_at
      DateTime :updated_at
    end
  end
end
