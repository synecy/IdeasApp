class IdeaEntry < ActiveRecord::Base
  require 'securerandom'
  has_many :idea_descriptions, dependent: :destroy


  def self.create( title, secret )
    uuid = ""
    uuid_temp = SecureRandom.hex[0..6].upcase
    uuid_temp.split("").each do |c|
      if rand().round == 1
        uuid << c.downcase
      else
        uuid << c
      end
    end
    idea = IdeaEntry.new( title: title.to_s, votes: 0, secret: secret.to_i, uuid: uuid.to_s )
    if !idea.save
      Rails.logger.error "ERROR: Failed to create new idea!"
      return idea
    end
    Rails.logger.info "SUCCESS: New idea created."
    return idea
  end


  def self.vote( uuid, vote_integer )
    idea = IdeaEntry.find_by( uuid: uuid.to_s )
    if !idea.nil?
      idea.votes += vote_integer.to_i
      if idea.save
        return true
      end
    end
    Rails.logger.error "ERROR: Failed to update idea votes for #{uuid.to_s}"
    return false
  end


end

