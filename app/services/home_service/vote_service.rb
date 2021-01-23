module HomeService
  class VoteService
    class NotSavedVoteServiceError < StandardError; end

    attr_reader :vote, :errors

    def initialize(params, session)
      @vote_new = params
      @session = session
      @errors = {}
    end

    def call
      vote = REDIS_CLIENT.get(@session)
      vote = if vote
               JSON.parse(vote)
             else
               []
             end
      vote.push({ "vote" => @vote_new })
      REDIS_CLIENT.set(@session, vote.to_json)
    end
  end
end
