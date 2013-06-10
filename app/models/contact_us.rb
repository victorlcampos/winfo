class ContactUs
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :name, :title, :email, :content

  validates :name, :title, :email, :content, presence: true
  validates :email, format: { with: /.+@.+\..+/i }, allow_blank: true

  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end

  def send_contact
    ContactUsMailer.contact_us(self).deliver
  end

  def persisted?
    false
  end
end