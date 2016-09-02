class BallotsController < ApplicationController

  # POST /ballots
  # POST /ballots.json
  def create
    @ballot = Ballot.new(ballot_params)
    @ballot.ip_address = request.remote_ip
    if @ballot.save
      render json: @ballot, status: :created
    else
      render json: @ballot.errors, status: :unprocessable_entity
    end
  end


  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def ballot_params
      params.require(:ballot).permit(:name, topic_ids: [])
    end
end
