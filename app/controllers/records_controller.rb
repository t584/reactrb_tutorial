class RecordsController < ApplicationController
  def index
    @records = Record.all
    render_component "RecordsComp", records: @records
  end
end
