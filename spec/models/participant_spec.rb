RSpec.describe Participant do
  describe "validation" do
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to have_many(:vote).dependent(:destroy) }
  end
end
