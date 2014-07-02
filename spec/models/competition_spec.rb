require 'spec_helper'

describe 'Model Competition' do
  context 'when there are 3 competitions in progress, one ended and one in the future' do
    before(:each) do
      @c1 = create(:competition, name: "C1", start_date: Time.now - 1.days, end_date: Time.now + 15.days)
      @c2 = create(:competition, name: "C2", start_date: Time.now - 2.days, end_date: Time.now + 15.days)
      @c3 = create(:competition, name: "C3", start_date: Time.now - 3.days, end_date: Time.now + 15.days)
      @c4 = create(:competition, name: "C4", start_date: Time.now + 15.days)
      @c5 = create(:competition, name: "C5", end_date: Time.now - 15.days)
    end

    describe '.in_progress' do
      it 'retrieves the 3 competitions in progress' do
        in_progress = Competition.in_progress
        expect(in_progress.count).to eq(3)
      end

      it 'retrieves the 3 competitions in progress in order' do
        in_progress = Competition.in_progress
        expect(in_progress[0]).to eq(@c3)
        expect(in_progress[1]).to eq(@c2)
        expect(in_progress[2]).to eq(@c1)
      end
    end
  end
end