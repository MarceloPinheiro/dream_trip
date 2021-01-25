RSpec.describe HomeService::FinishService do
  context "when #call" do
    let!(:session) { Faker::Blockchain::Tezos.account }
    let!(:participant) { {name: "teste", email:"teste@teste.com"} }
    let!(:vote_params) { rand(1..4) }

    it "save votes to participant" do
      vote_service = HomeService::VoteService.new(vote_params, session)
      vote_service.call

      service = described_class.new(participant, session)
      service.call
      expect(service.totalv).to eq Vote.all
    end
    
  end
end