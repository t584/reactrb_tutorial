class RecordsController < ApplicationController
  def index
    @records = Record.all
    render_component "RecordsComp", data: @records
  end
end
