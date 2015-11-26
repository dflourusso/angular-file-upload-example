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
end
