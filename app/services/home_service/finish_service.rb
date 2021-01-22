module HomeService
  class FinishService
    class NotSavedVoteServiceError < StandardError; end

    attr_reader :totalv, :errors

    def initialize(params,session)
      @params = params.deep_symbolize_keys
      @session = session
      @errors = {}
      @totalv = nil
    end

    def call
      #check umail exists
      participant = Participant.where(email: @params[:email])
      .first_or_create(
        email: @params[:email],
        name: @params[:name]
      )
      votes = REDIS_CLIENT.get(@session)
      votes = JSON.parse(votes, symbolize_names: true)
      votes.each do |vote|
        Vote.create(destination_id: vote[:vote].to_i, participant_id: participant.id)
      end

      @totalv = Vote.all()
    end

  end
end