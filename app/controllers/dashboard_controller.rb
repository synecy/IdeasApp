class DashboardController < ApplicationController

  def index
  end


  def new
    title = "No title"
    descs = []

    params.each do |key, value|
      if key == "idea_title"
        title = value
      end
      if key.include? "desc"
        descs << value
      end
    end

    if title == "No title"
      flash[:error] = "Nice try pal but you are still gonna need that title."
      redirect_to controller: 'landing', action: 'index'
      return
    end

    idea = IdeaEntry.create(title.to_s, 0)
    if !idea.nil?
      flash[:success] = "New idea posted!"
      descs.each do |description|
        if description.length > 0
          if !idea.idea_descriptions.create( description: description.to_s, votes: 0 )
            flash[:error] = "Oops.. Something went wrong."
          end
        end
      end
    else
      flash[:error] = "Oops.. Something went wrong. Failed to post new idea."
    end
    redirect_to controller: 'landing', action: 'index'
    return
  end


end
