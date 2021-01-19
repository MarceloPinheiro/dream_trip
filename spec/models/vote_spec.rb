RSpec.describe Vote do
  describe "validation" do
    it { is_expected.to belong_to :destination }
    it { is_expected.to belong_to :participant }
  end
end
