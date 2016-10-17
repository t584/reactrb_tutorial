class HomeController < ApplicationController
  def search_path
    render_component "Components::Home::SearchPath"
  end

  def clock
    # render_component 'Clock', initial_mode: 12
  end
end
