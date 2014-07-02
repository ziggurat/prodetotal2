require 'spec_helper'

describe 'Model Challenge' do
  it 'fails to create a challenge with non existent competition' do
    user = User.create
    challenge = Challenge.create({name: "Some name", owner_id: user.id, competition_id: 1})
    expect(challenge.errors.count).to eq(1)
  end

  it 'fails to create a challenge with non existent owner' do
    competition = create(:competition)
    challenge = Challenge.create({name: "Some name", owner_id: 1, competition_id: competition.id})
    expect(challenge.errors.count).to eq(1)
  end

  it 'fails to create a challenge with no name' do
    user = User.create
    competition = create(:competition)
    challenge = Challenge.create({name: nil, owner_id: user.id, competition_id: competition.id})
    expect(challenge.errors.count).to eq(1)
  end
end