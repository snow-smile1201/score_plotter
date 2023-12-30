class ResultsController < ApplicationController
  def index
    @results = Result.all
  end

  def show
  end
end
