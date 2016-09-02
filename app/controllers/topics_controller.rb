class TopicsController < ApplicationController
  before_action :set_topic, only: [:show, :destroy]

  def index
    @topics = Topic.open
    render json: @topics
  end

  def show
    render json: @topic
  end

  def new
    @topic = Topic.new
  end

  def create
    @topic = Topic.new(topic_params)
    if @topic.save
      render json: @topic, status: :created
    else
      render json: @topic.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @topic.closed!
    head :no_content
  end

  private
    def set_topic
      @topic = Topic.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      head :not_found
    end

    def topic_params
      params.require(:topic).permit(:name, :author)
    end
end
