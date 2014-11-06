class AddIdeaEntryIdForDescs < ActiveRecord::Migration
  def change
	add_reference :idea_descriptions, :idea_entry, index: true
  end
end
