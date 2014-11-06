class LandingController < ApplicationController
  respond_to :html, :json

  def index
    @idea_content = []
    idea_entries = IdeaEntry.all.order(created_at: :desc).limit(20)
    idea_entries.each do |entry|
      @idea_content << {
        "idea_entry" => entry.title,
        "idea_votes" => entry.votes,
        "idea_uuid" => entry.uuid
      }
    end
  end


  def vote
    @vote_integer = 0
    if !params[:vote_value].nil? and !params[:uuid].nil?
      if params[:vote_value].to_i > 0
        @vote_integer = 1
      else
        @vote_integer = -1
      end
      if IdeaEntry.vote( params[:uuid].to_s, @vote_integer )
        render json: {uuid: params[:uuid].to_s, vote_value: @vote_integer}
      end
    end
  end


end

