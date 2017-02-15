# == Schema Information
#
# Table name: cat_rental_requests
#
#  id         :integer          not null, primary key
#  cat_id     :integer          not null
#  start_date :date             not null
#  end_date   :date             not null
#  status     :string           default("PENDING"), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class CatRentalRequest < ActiveRecord::Base
  validates :status, inclusion: { in: %w(PENDING APPROVED DENIED) }
  validates :cat_id, :start_date, :end_date, presence: true
  validate :overlapping_requests

  def overlapping_requests
    #id: self.id, cat_id: self.cat_id, start_date: self.start_date, end_date: self.end_date)
    #do query, get all rental rquests that match cat id
    collisions = CatRentalRequest
      .where(cat_id: self.cat_id)
      .where(status: "APPROVED")
      .where("start_date BETWEEN '#{self.start_date}' AND '#{self.end_date}'")
      .where("end_date BETWEEN '#{self.start_date}' AND '#{self.end_date}'")
      .count
    self.errors[:Overlapping] << "requests" if collisions > 0
  end

  belongs_to :cat
end
