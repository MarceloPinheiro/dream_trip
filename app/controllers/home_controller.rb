class HomeController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    @destinations = Destination.all().select(:id,:description,:place, :image).to_a.combination(2)
    @first = true
    @i=1
  end

  def finish
    fn = finish_params.to_h
    ret = HomeService::FinishService.new(fn, session.id)
    ret.call
    @totalv = ret.totalv
    @me = Participant.find_by(email: fn[:email])
    REDIS_CLIENT.del(session.id)
  end

  def vote_add
    vote = HomeService::VoteService.new(params[:vote], session.id).call
    respond_to do |format|
      format.json {render(json: vote.to_json, status: :ok)}
    end
  end

  private
    def finish_params
      params.require(:vote).permit(:name, :email)
    end

end
