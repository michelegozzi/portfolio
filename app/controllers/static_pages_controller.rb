class StaticPagesController < ApplicationController
  def home
    @sectors = Sector.order("id asc").all
  end

  def contact
    @contact_profiles = ContactProfile.order("priority asc").all
  end
end
