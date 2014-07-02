require 'spec_helper'

describe 'Model Competition' do
  context 'when there are 3 competitions in progress, 1 ended and 3 in the future' do
    before(:each) do
      @c1 = create(:competition, name: "In progress 1", start_date: Time.now - 1.days, end_date: Time.now + 15.days)
      @c2 = create(:competition, name: "In progress 2", start_date: Time.now - 2.days, end_date: Time.now + 15.days)
      @c3 = create(:competition, name: "In progress 3", start_date: Time.now - 3.days, end_date: Time.now + 15.days)
      @c4 = create(:competition, name: "Upcoming 1", start_date: Time.now + 5.days)
      @c5 = create(:competition, name: "Upcoming 2", start_date: Time.now + 10.days)
      @c6 = create(:competition, name: "Upcoming 3", start_date: Time.now + 15.days)
      @c7 = create(:competition, name: "Ended 1", end_date: Time.now - 15.days)
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

    describe '.upcoming' do
      it 'retrieves the 3 upcoming competitions in order' do
        upcoming = Competition.upcoming
        expect(upcoming.count).to eq(3)
        expect(upcoming[0]).to eq(@c4)
        expect(upcoming[1]).to eq(@c5)
        expect(upcoming[2]).to eq(@c6)
      end
    end

    describe '.near' do
      it 'retrieves the on going and future competitions in order' do
        near = Competition.near
        expect(near.count).to eq(6)
        expect(near[0]).to eq(@c3)
        expect(near[1]).to eq(@c2)
        expect(near[2]).to eq(@c1)
        expect(near[3]).to eq(@c4)
        expect(near[4]).to eq(@c5)
        expect(near[5]).to eq(@c6)
      end
    end
  end
end