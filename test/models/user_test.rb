class UserTest < MiniTest::Rails::Model
  before do
    @user = User.new
  end

  it "must be valid" do
    @user.valid?.must_equal true
  end

  it "must be a real test" do
    flunk "Need real tests"
  end

  # describe "when doing its thing" do
  #   it "must be interesting" do
  #     @user.blow_minds!
  #     @user.interesting?.must_equal true
  #   end
  # end
end

