# frozen_string_literal: true

require_relative '../../init.rb'
require 'aws-sdk-sqs'

module TravellingSuggestions
  # Scheduled worker to update mbti recommendation model
  class MBTIModelUpdateWorker
    def initialize
      @config = MBTIModelUpdateWorker.config
      @queue = CodePraise::Messaging::Queue.new(
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
