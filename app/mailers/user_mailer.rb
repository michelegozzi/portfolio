class UserMailer < ActionMailer::Base
  default from: "noreply@***REMOVED***-portfolio.herokuapp.com"

  def contact_email(dispatch)
    @dispatch = dispatch

    @email_contact_profiles = ContactProfile.where(profile_type: ContactProfile::TYPES[:email]).pluck(:value)

    
    mail(to: @email_contact_profiles.join(','), subject: 'Message from your portfolio') unless @email_contact_profiles.nil?
    
  end
end
