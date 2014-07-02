require 'spec_helper'

describe 'Model Match' do
  it 'fails to create a match with non existent competition' do
    lt = create(:local_team)
    vt = create(:visitor_team)
    match = Match.new({local_id: lt.id, visitor_id: vt.id, competition_id: 1})
    match.save
    expect(match.errors.count).to eq(1)
  end

  it 'fails to create a match with non existent local team' do
    comp = create(:competition)
    vt = create(:visitor_team)
    match = Match.new({local_id: nil, visitor_id: vt.id, competition_id: comp.id})
    match.save
    expect(match.errors.count).to eq(1)
  end

  it 'fails to create a match with non existent visitor team' do
    comp = create(:competition)
    lt = create(:local_team)
    match = Match.new({local_id: lt.id, visitor_id: nil, competition_id: comp.id})
    match.save
    expect(match.errors.count).to eq(1)
  end

  it 'sets the score of the match' do
    comp = create(:competition)
    lt = create(:local_team)
    vt = create(:visitor_team)
    match = Match.new({local_id: lt.id, visitor_id: vt.id, competition_id: comp.id})
    match.save

    retrieved_match = Match.find(match.id)
    retrieved_match.save_score(1, 2)

    retrieved_match2 = Match.find(match.id)
    expect(retrieved_match2.local_score).to eq(1)
    expect(retrieved_match2.visitor_score).to eq(2)
  end
end