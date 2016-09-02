class HomeController < ApplicationController
  def topics
  end

  def ballots
  end

  def results
  end

  def lol
    @topics = (1..4).map { |i|
      OpenStruct.new(id: i, name: "name #{i}", author: "author #{i}").marshal_dump
    } 
    render json: @topics.to_json
  end
end
