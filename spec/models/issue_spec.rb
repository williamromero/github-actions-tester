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
require 'rails_helper'

RSpec.describe Issue, type: :model do
  
  describe "Issue model" do
    before { described_class.new(number: '232234', title: 'Model field issue') }
    
    context "when tests about relations of model" do
      it "should respond if Issue has many events relation" do
        expect(Issue.reflect_on_association(:events).macro).to eq(:has_many)
      end
      it { should validate_uniqueness_of(:number).on(:create) }
    end

    context "testing fields if are valid" do

      it 'is invalid if the number is not unique' do
        expect(subject).to be_invalid # expect(subject).to be_invalid
      end

      it 'is invalid if the title is not null' do
        expect(subject).to be_invalid
      end 
    end

    context "testing fields if are present" do
      it 'checking if number is present' do
        expect(subject).to validate_presence_of(:number)
      end

      it 'checking if title is present' do
        expect(subject).to validate_presence_of(:title)
      end
    end

  end
end
