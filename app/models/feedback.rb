class Feedback < ActiveRecord::Base
  validate :phone_or_email 
  validates :comment, presence: true 
  private

  def phone_or_email
    errors.add(:contact, I18n.t('feedback.errors.phone_or_email')) unless self.email.present? || self.phone.present?
  end

end
