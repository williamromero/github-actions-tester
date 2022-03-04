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
FactoryBot.define do
  factory :event do
    association :issue
    action  { "opened" }
    payload { "{}" }
    user    { "williamromero" }
    # issue
  end
end
