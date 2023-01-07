# frozen_string_literal: true

require 'roar/decorator'
require 'roar/json'

module TravellingSuggestions
  module Representer
    # A Representer object for an mbti update request
    class UpdateRequest < Roar::Decorator
      include Roar::JSON

      property :mbti
      property :attraction_id
      property :preference
    end
  end
end
