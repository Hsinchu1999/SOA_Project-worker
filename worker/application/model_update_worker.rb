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
        Entity::Preference.new(
          attraction_id,
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
        Repository::Preference.db_create(attraction_id: update.attraction_id)
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
