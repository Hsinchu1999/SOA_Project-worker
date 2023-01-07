# frozen_string_literal: true

require_relative '../../init.rb'
require 'aws-sdk-sqs'

module TravellingSuggestions
  # Scheduled worker to update mbti recommendation model
  class MBTIModelUpdateWorker
    def initialize
      @config = MBTIModelUpdateWorker.config
      @queue = TravellingSuggestions::Messaging::Queue.new(
        @config.TSP_QUEUE_URL, @config
      )
    end

    def call
      puts "REPORT DateTime: #{Time.now}"
      updates = update_mbti_model
      puts 'finished update_mbti_model'
      puts "updates=#{updates}"
      update_api_model()
      puts 'finished update_api_model'
      puts "finished MBTIModelUpdateWorker.call"

    end

    def update_mbti_model
      updates = []
      @queue.poll do |update_request_json|
        update_request = Representer::UpdateRequest
          .new(OpenStruct.new)
          .from_json(update_request_json)
        updates.push update_request
      end
      updates.each do |update|
        column= "#{update.mbti.downcase}_#{update.preference}".to_sym
        db_update = Repository::Preferences.db_find_or_create(Entity::Preference.new(
          id: nil,
          attraction_id: update.attraction_id,
          enfj_like: nil,
          enfj_dislike: nil,
          enfp_like: nil,
          enfp_dislike: nil,
          entj_like: nil,
          entj_dislike: nil,
          entp_like: nil,
          entp_dislike: nil,
          esfj_like: nil,
          esfj_dislike: nil,
          esfp_like: nil,
          esfp_dislike: nil,
          estj_like: nil,
          estj_dislike: nil,
          estp_like: nil,
          estp_dislike: nil,
          infj_like: nil,
          infj_dislike: nil,
          infp_like: nil,
          infp_dislike: nil,
          intj_like: nil,
          intj_dislike: nil,
          intp_like: nil,
          intp_dislike: nil,
          isfj_like: nil,
          isfj_dislike: nil,
          isfp_like: nil,
          isfp_dislike: nil,
          istj_like: nil,
          istj_dislike: nil,
          istp_like: nil,
          istp_dislike: nil))
        rebuild_update = Repository::Preferences.rebuild_entity(db_update)
        update_value = rebuild_update.send("#{update.mbti.downcase}_#{update.preference}").to_i + 1
        db_update.update(column => update_value)

        # preferences = {}
        # preferences['enfj_like'] =rebuild_update.enfj_like.to_s
        # preferences['enfj_dislike'] =rebuild_update.enfj_dislike.to_s
        # preferences['enfp_like'] =rebuild_update.enfp_like.to_s
        # preferences['enfp_dislike'] =rebuild_update.enfp_dislike.to_s
        # preferences['entj_like'] =rebuild_update.entj_like.to_s
        # preferences['entj_dislike'] =rebuild_update.entj_dislike.to_s
        # preferences['entp_like'] =rebuild_update.entp_like.to_s
        # preferences['entp_dislike'] =rebuild_update.entp_dislike.to_s
        # preferences['esfj_like'] =rebuild_update.esfj_like.to_s
        # preferences['esfj_dislike'] =rebuild_update.esfj_dislike.to_s
        # preferences['esfp_like'] =rebuild_update.esfp_like.to_s
        # preferences['esfp_dislike'] =rebuild_update.esfp_dislike.to_s
        # preferences['estj_like'] =rebuild_update.estj_like.to_s
        # preferences['estj_dislike'] =rebuild_update.estj_dislike.to_s
        # preferences['estp_like'] =rebuild_update.estp_like.to_s
        # preferences['estp_dislike'] =rebuild_update.estp_dislike.to_s
        # preferences['infj_like'] =rebuild_update.infj_like.to_s
        # preferences['infj_dislike'] =rebuild_update.infj_dislike.to_s
        # preferences['infp_like'] =rebuild_update.infp_like.to_s
        # preferences['infp_dislike'] =rebuild_update.infp_dislike.to_s
        # preferences['intj_like'] =rebuild_update.intj_like.to_s
        # preferences['intj_dislike'] =rebuild_update.intj_dislike.to_s
        # preferences['intp_like'] =rebuild_update.intp_like.to_s
        # preferences['intp_dislike'] =rebuild_update.intp_dislike.to_s
        # preferences['isfj_like'] =rebuild_update.isfj_like.to_s
        # preferences['isfj_dislike'] =rebuild_update.isfj_dislike.to_s
        # preferences['isfp_like'] =rebuild_update.isfp_like.to_s
        # preferences['isfp_dislike'] =rebuild_update.isfp_dislike.to_s
        # preferences['istj_like'] =rebuild_update.istj_like.to_s
        # preferences['istj_dislike'] =rebuild_update.istj_dislike.to_s
        # preferences['istp_like'] =rebuild_update.istp_like.to_s
        # preferences['istp_dislike'] =rebuild_update.istp_dislike.to_s

        # Gateway::Api.new(TravellingSuggestions::MBTIModelUpdateWorker.config)
        #             .update_model(update.attraction_id, preferences)
        #             .then do |result|
        #               result.success? ? puts("update success") : puts("update failed")
        #             end
      end
      updates
    end

    def update_api_model
      puts 'In update_api_model'
      rebuild_updates = Repository::Preferences.find_all
      puts "rebuild_updates=#{rebuild_updates}"
      puts "rebuild_updates.length=#{rebuild_updates.length}"
      puts "rebuild_updates.class=#{rebuild_updates.class}"

      rebuild_updates.each do |rebuild_update|
        preferences = {}
        preferences['enfj_like'] =rebuild_update.enfj_like.to_s
        preferences['enfj_dislike'] =rebuild_update.enfj_dislike.to_s
        preferences['enfp_like'] =rebuild_update.enfp_like.to_s
        preferences['enfp_dislike'] =rebuild_update.enfp_dislike.to_s
        preferences['entj_like'] =rebuild_update.entj_like.to_s
        preferences['entj_dislike'] =rebuild_update.entj_dislike.to_s
        preferences['entp_like'] =rebuild_update.entp_like.to_s
        preferences['entp_dislike'] =rebuild_update.entp_dislike.to_s
        preferences['esfj_like'] =rebuild_update.esfj_like.to_s
        preferences['esfj_dislike'] =rebuild_update.esfj_dislike.to_s
        preferences['esfp_like'] =rebuild_update.esfp_like.to_s
        preferences['esfp_dislike'] =rebuild_update.esfp_dislike.to_s
        preferences['estj_like'] =rebuild_update.estj_like.to_s
        preferences['estj_dislike'] =rebuild_update.estj_dislike.to_s
        preferences['estp_like'] =rebuild_update.estp_like.to_s
        preferences['estp_dislike'] =rebuild_update.estp_dislike.to_s
        preferences['infj_like'] =rebuild_update.infj_like.to_s
        preferences['infj_dislike'] =rebuild_update.infj_dislike.to_s
        preferences['infp_like'] =rebuild_update.infp_like.to_s
        preferences['infp_dislike'] =rebuild_update.infp_dislike.to_s
        preferences['intj_like'] =rebuild_update.intj_like.to_s
        preferences['intj_dislike'] =rebuild_update.intj_dislike.to_s
        preferences['intp_like'] =rebuild_update.intp_like.to_s
        preferences['intp_dislike'] =rebuild_update.intp_dislike.to_s
        preferences['isfj_like'] =rebuild_update.isfj_like.to_s
        preferences['isfj_dislike'] =rebuild_update.isfj_dislike.to_s
        preferences['isfp_like'] =rebuild_update.isfp_like.to_s
        preferences['isfp_dislike'] =rebuild_update.isfp_dislike.to_s
        preferences['istj_like'] =rebuild_update.istj_like.to_s
        preferences['istj_dislike'] =rebuild_update.istj_dislike.to_s
        preferences['istp_like'] =rebuild_update.istp_like.to_s
        preferences['istp_dislike'] =rebuild_update.istp_dislike.to_s

        Gateway::Api.new(TravellingSuggestions::MBTIModelUpdateWorker.config)
                    .update_model(rebuild_update.attraction_id, preferences)
                    .then do |result|
                      result.success? ? puts("update success") : puts("update failed")
                    end
      end
    end
  end
end
