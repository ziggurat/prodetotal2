require 'spec_helper'

describe 'Competition management' do

  it 'creates a Competition, retrieve it and modify it' do
    post '/api/v1/competitions',  exact_match_points: 6,
                                  result_match_points: 3,
                                  no_match_points: 1,
                                  no_forecast_points: 0,
                                  name: 'Copa del Mundo Brasil 2014',
                                  start_date: '2014-06-12',
                                  end_date: '2014-07-14'

    response.status.should eql(201)
    post_json = JSON.parse(response.body)
    expect(post_json['exact_match_points']).to eq(6)
    expect(post_json['result_match_points']).to eq(3)
    expect(post_json['no_match_points']).to eq(1)
    expect(post_json['no_forecast_points']).to eq(0)
    expect(post_json['name']).to eq('Copa del Mundo Brasil 2014')
    expect(post_json['start_date']).to eq('2014-06-12')
    expect(post_json['end_date']).to eq('2014-07-14')
    competition_id = post_json['id']

    get "/api/v1/competitions/#{competition_id}.json"
    response.status.should eql(200)
    get_json = JSON.parse(response.body)
    expect(get_json['id']).to eq(competition_id)
    expect(get_json['exact_match_points']).to eq(6)
    expect(get_json['result_match_points']).to eq(3)
    expect(get_json['no_match_points']).to eq(1)
    expect(get_json['no_forecast_points']).to eq(0)
    expect(get_json['name']).to eq('Copa del Mundo Brasil 2014')
    expect(get_json['start_date']).to eq('2014-06-12')
    expect(get_json['end_date']).to eq('2014-07-14')

    put "/api/v1/competitions/#{competition_id}", no_match_points: 0
    response.status.should eql(200)
    put_json = JSON.parse(response.body)
    expect(put_json['id']).to eq(competition_id)
    expect(put_json['exact_match_points']).to eq(6)
    expect(put_json['result_match_points']).to eq(3)
    expect(put_json['no_match_points']).to eq(0)
    expect(put_json['no_forecast_points']).to eq(0)
    expect(put_json['name']).to eq('Copa del Mundo Brasil 2014')
    expect(put_json['start_date']).to eq('2014-06-12')
    expect(put_json['end_date']).to eq('2014-07-14')
  end

  it "doesn't allow to create a Competition with same name as existing one" do
    # Create team
    post '/api/v1/competitions', name: 'World Cup 2014'
    response.status.should eql(201)

    post '/api/v1/competitions', name: 'World Cup 2014'
    response.status.should eql(422)
    post_json = JSON.parse(response.body)
    expect(post_json.keys.size).to eq(1)
    expect(post_json.keys.include?('name')).to be true
  end

  it "doesn't allow to create a Competition without name" do
    post '/api/v1/competitions'
    response.status.should eql(422)
    post_json = JSON.parse(response.body)
    expect(post_json.keys.size).to eq(1)
    expect(post_json.keys.include?('name')).to be true
  end

end
