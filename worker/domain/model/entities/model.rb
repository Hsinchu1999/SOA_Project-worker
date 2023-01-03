# frozen_string_literal: true

module TravellingSuggestions
  module Entity
    # An Entity object for recommendation model
    class Model

      attr_accessor :model

      def initialize(preferences)

        model_temp = {}
        preferences[0].brief()[:mbti].each do |mbti, _|
          model_temp[mbti] = []
        end
        
        preferences.each do |preference|
          preference_brief = preference.brief
          preference_brief[:mbti].each do |mbti, score|
            model_temp[mbti].append([preference_brief[:attraction_id], score])
          end
        end

        @model = model_temp.map do |mbti, model_list|
          model_list.sort_by { |pair| pair[1] }
        end
      end

      # suggests the best attractions (attraction_id) of an mbti (type=symbol) and set size
      def suggest(mbti, set_size)
        result = @model[mbti][0, set_size].map do |pair|
          pair[0]
        end
      end
    end
  end
end
