
class IndexController < ApplicationController
  def home
    @users = User.all
  end

  def contact_us
  end

  def about
  end
end
