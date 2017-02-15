# == Schema Information
#
# Table name: cats
#
#  id          :integer          not null, primary key
#  birth_date  :date             not null
#  color       :string           not null
#  name        :string           not null
#  sex         :string(1)        not null
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Cat < ActiveRecord::Base
  CAT_COLORS = %w(white black brown calico grey siamese orange cow)
  validates :color, inclusion: { in: CAT_COLORS,
    message: "%{value} is not a valid color"
  }, presence: true
  validates :sex, inclusion: { in: %w(M F),
    message: "%{value} is not a valid gender (sorry)"
  }, length: { is: 1 }, presence: true
  validates :name, :birth_date, presence: true

  def age
    (Date.today - self.birth_date).to_i/365
  end

  has_many :rental_requests,
    class_name: :CatRentalRequest,
    dependent: :destroy
end
