class HomeController < ApplicationController
  def avatar
    render_component "Avatar"#, user_name: "pwh"
  end
  def search_path
    render_component "Components::Home::SearchPath"
  end

  def clock
    # render_component 'Clock', initial_mode: 12
  end

  def record
    # @records = Record.all
    render_component "RecordComp"#, data: @records
  end
end
