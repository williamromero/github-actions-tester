# == Schema Information
#
# Table name: events
#
#  id         :bigint           not null, primary key
#  action     :text(65535)
#  payload    :text(65535)
#  user       :text(65535)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  issue_id   :bigint           not null
#
# Indexes
#
#  index_events_on_issue_id  (issue_id)
#
# Foreign Keys
#
#  fk_rails_...  (issue_id => issues.id)
#
class Event < ApplicationRecord
  belongs_to :issue
  validates :action, presence: true, inclusion: { in: %w(opened edited deleted transferred pinned unpinned closed reopened assigned unassigned labeled unlabeled milestoned demilestoned locked unlocked) }
  validates :payload, presence: true
  validates :user, presence: true
  validates :issue_id, presence: true

end
