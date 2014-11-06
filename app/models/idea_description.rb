class IdeaDescription < ActiveRecord::Base
  belongs_to :idea_entry

  def self.create( description )
    description = IdeaDescription.new( description: description.to_s, votes: 0 )
    if !description.save?
      Rails.logger.error "ERROR: Failed to add new description!"
      return false
    end
    Rails.logger.info "SUCCESS: New description added."
    return true
  end

end
