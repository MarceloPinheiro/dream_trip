RSpec.describe HomeService::VoteService do
  context "when #call" do
    let!(:session) { Faker::Blockchain::Tezos.account }
    let!(:vote) { rand(1..4) }

    it "save new vote" do
      service = described_class.new(vote, session)
      service.call
      ret_json = {"vote_new":vote, "session":session, "errors":{}}.to_json
      expect(service.to_json).to eq ret_json
    end
    
  end
end