class Reservation < ActiveRecord::Base
  belongs_to :listing
  belongs_to :guest, :class_name => "User"
  has_one :review
  validates :checkin, presence: true
  validates :checkout, presence: true
  validate :reserving_own_listing

  def reserving_own_listing
    return unless errors.blank?
    if guest == listing.host
      errors[:guest] = 'cannot be same as host'
    end
  end
end
