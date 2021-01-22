module HomeService
  class VoteService
    class NotSavedVoteServiceError < StandardError; end

    attr_reader :vote, :errors

    def initialize(params,session)
      @vote_new = params
      @session = session
      @errors = {}
    end

    def call
      vote = REDIS_CLIENT.get(@session)
      if vote
        print("Tem coisa no Redis: #{vote}")
        vote = JSON.parse(vote)
        vote.push({
          "vote" => @vote_new
        })
        REDIS_CLIENT.set(@session, vote.to_json)
      else
        print("Não tem nada no Redis")
        vote = []
        vote.push({
          "vote" => @vote_new
        })
        REDIS_CLIENT.set(@session, vote.to_json)
      end

    end

    #def destroy
      #REDIS_CLIENT.del(session.id)
    #end

  end
end