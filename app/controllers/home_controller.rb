class HomeController < ApplicationController
  def search_path
    render_component "Components::Home::SearchPath"
  end
end
