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
      puts updates

      # if cloned_projects.any?
      #   # TODO: Email administrator instead of printing to STDOUT
      #   puts "\tNumber of unique repos cloned: #{cloned_projects.count}"
      #   puts "\tTotal disk space: #{total_size}"
      # else
      #   puts "\tNo cloning reported in this period"
      # end

      
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
        db_update = Repository::Preferences.db_find_or_create(Entity::Preference.new(id: nil, attraction_id: update.attraction_id,
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
      end
      updates
    end

    def cloned_projects
      return @cloned_projects if @cloned_projects

      @cloned_projects = {}
      @queue.poll do |clone_request_json|
        clone_request = Representer::CloneRequest
          .new(OpenStruct.new)
          .from_json(clone_request_json)
        @cloned_projects[clone_request.project.origin_id] = clone_request.project
        print '.'
      end

      @cloned_projects.tap { puts }
    end

    def total_size
      cloned_projects.values.reduce(0) { |size, project| size + project.size }
    end
  end
end
