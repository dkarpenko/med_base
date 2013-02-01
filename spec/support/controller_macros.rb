module ControllerMacros
  def login_user
    before(:each) do
      user = FactoryGirl.create(:user)
      sign_in :user, user
    end
  end
end