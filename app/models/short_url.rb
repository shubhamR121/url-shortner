class ShortUrl < ApplicationRecord
  validates_presence_of :full

  before_create :generate_short_url

  def generate_short_url
    self.short = SecureRandom.uuid[0..5]
  end

  def expiry?
    !(created_at.to_date > Date.today - 30.days)
  end
end
