# == Schema Information
#
# Table name: anexos
#
#  id            :integer          not null, primary key
#  file          :string
#  anexavel_id   :integer
#  anexavel_type :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Anexo < ActiveRecord::Base
  belongs_to :anexavel, polymorphic: true
end
