RSpec.describe Participant do
  describe "validation" do
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:name) }
  end
end
