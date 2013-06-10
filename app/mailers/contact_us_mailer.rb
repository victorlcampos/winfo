class ContactUsMailer < ActionMailer::Base
  def contact_us(contact)
    email_params = {
      to: Settings.contact_email,
      from: "#{contact.name} <#{contact.email}>",
      subject: contact.title,
      body: contact.content
    }
    mail(email_params)
  end
end
