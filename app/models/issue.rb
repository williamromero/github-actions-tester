# == Schema Information
#
# Table name: issues
#
#  id         :bigint           not null, primary key
#  number     :bigint
#  title      :text(65535)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Issue < ApplicationRecord
  has_many :events

  validates :number, presence: true, uniqueness: true
  validates :title, presence: true
end
