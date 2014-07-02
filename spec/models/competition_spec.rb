require 'spec_helper'

describe '.in_progress' do
  context 'when there are 3 competitions in progress, one ended and one in the future' do
    before(:each) do
      create(:competition)
      create(:competition)
      create(:competition)
      create(:competition, start_date: Time.now + 15.days)
      create(:competition, end_date: Time.now - 15.days)
    end

    it 'retrieves the 3 competitions in progress' do      
      in_progress = Competition.in_progress
      expect(in_progress).to eq(3)
    end  
  end
  
end