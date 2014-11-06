class IdeapostController < ApplicationController

	def index
    if !params[:id].nil?
      @idea_title = "No title"
      @idea_content = []
      idea = IdeaEntry.find_by( uuid: params[:id].to_s )
      if !idea.nil?
        @idea_title = idea.title.to_s
        idea.idea_descriptions.each do |entry|
          @idea_content << {
            "idea_description" => entry.description
          }
        end
      end
    end
  end

end
