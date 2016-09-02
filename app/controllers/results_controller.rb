class ResultsController < ApplicationController

  def index
    open_topics = Topic.open
    ballots = Ballot.all
    results = sum_topic_count(open_topics, ballots)
    @results = sort_results(results)
    render json: @results, status: :ok
  end

  private

  def sum_topic_count(open_topics, ballots)
    topic_ids = ballots.map(&:topic_ids).flatten
    counts = Hash.new(0)
    topic_ids.each{ |topic_id| counts[topic_id] += 1}
    results = counts.map do |k,v|
      bleh = Topic.find(k).attributes.merge({ count: v }).symbolize_keys
      bleh.delete_if{ |k,v| [:created_at, :updated_at, :state].include? k}
    end
  end

  def sort_results(results)
    results.sort_by{ |k,v| k[:count] }.reverse
  end

end
