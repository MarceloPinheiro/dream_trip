RSpec.describe Destination do
  describe "validation" do
    it { is_expected.to validate_presence_of(:place) }
    it { is_expected.to validate_presence_of(:image) }
  end
end
