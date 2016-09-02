class ResultsController < ApplicationController

  def index
    open_topics = Topic.open
    ballots = Ballot.all
    @results = sum_topic_count(open_topics, ballots)
    render json: @results, status: :ok
  end

  private

  def sum_topic_count(open_topics, ballots)
    topic_ids = ballots.map(&:topic_ids).flatten
    counts = Hash.new(0)
    topic_ids.each{ |topic_id| counts[topic_id] += 1}
    results = include_vote_count_in_topics(counts)
    sort_results(results)
  end

  def sort_results(results)
    results.sort_by{ |k,v| k[:count] }.reverse
  end

  def include_vote_count_in_topics(counts)
    counts.map do |k,v|
      bleh = Topic.find(k).attributes.merge({ count: v }).symbolize_keys
      bleh.delete_if{ |k,v| [:created_at, :updated_at, :state].include? k}
    end
  end

end
