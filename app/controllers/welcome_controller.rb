require 'uri'

class WelcomeController < ApplicationController
  def index

    @twitter_contact_profiles = ContactProfile.where(profile_type: ContactProfile::TYPES[:twitter]).pluck(:value)

    if !@twitter_contact_profiles.nil?

      @twitter_url = "https://twitter.com/share"
      @twitter_url += "?text=#{URI.escape('Hi Michele!')}"
      @twitter_url += "&related=#{URI.escape(@twitter_contact_profiles.join(','))}"
      @twitter_url += "&hashtags=#{URI.escape('portfolio')}"

    end

    #@contact_profiles = ContactProfile.order("priority asc").all

    @personal_detail = PersonalDetail.first

    @skillsets = Skillset.order("id asc").all

    render layout: "welcome"
  end
end
