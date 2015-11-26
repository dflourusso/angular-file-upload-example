# == Schema Information
#
# Table name: anexos
#
#  id         :integer          not null, primary key
#  data       :string
#  anexo_id   :integer
#  anexo_type :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Anexo < ActiveRecord::Base
end
