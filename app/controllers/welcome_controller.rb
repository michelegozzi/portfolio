class WelcomeController < ApplicationController
  def index
    @contact_profiles = ContactProfile.order("priority asc").all
    render layout: "welcome"
  end
end
