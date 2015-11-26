# == Schema Information
#
# Table name: docs
#
#  id         :integer          not null, primary key
#  nome       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Doc < ActiveRecord::Base
  has_many :anexos, as: :anexavel, dependent: :destroy
  accepts_nested_attributes_for :anexos

  validates :nome, presence: true
end
