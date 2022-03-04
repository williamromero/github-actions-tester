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
require 'rails_helper'

RSpec.describe Event, type: :model do

  describe "Event model" do
    let!(:issue) { create(:issue, title: 'testing') }
    let!(:event) { create(:event) }
    
    context "when run tests relations on event model" do
      it "should respond with belongs_to issue model" do
        expect(subject).to belong_to(:issue)
      end
    end

    context "when run tests to check presence of fields" do

      subject { event }

      it 'should resolve if action is present' do
        expect(subject).to validate_inclusion_of(:action).in_array(%w(opened edited deleted transferred pinned unpinned closed reopened assigned unassigned labeled unlabeled milestoned demilestoned locked unlocked))
      end

      it 'should resolve if payload is present' do
        expect(subject).to validate_presence_of(:payload)
      end

      it 'should resolve if user is present' do
        expect(subject).to validate_presence_of(:user)
      end

      it 'should resolve if issue_id is present' do
        expect(subject).to validate_presence_of(:issue_id)
      end 


    end

  end

end
