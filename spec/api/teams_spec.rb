require 'spec_helper'

describe 'Team management' do

  it 'creates a Team, retrieve it and modify it' do
    # Create team
    post '/api/v1/teams', name: 'Argentina', key: 'argentina'
    response.status.should eql(201)
    post_json = JSON.parse(response.body)
    expect(post_json['name']).to eq('Argentina')
    expect(post_json['key']).to eq('argentina')
    team_id = post_json['id']

    # Retrieve team
    get "/api/v1/teams/#{team_id}.json"
    response.status.should eql(200)
    get_json = JSON.parse(response.body)
    expect(get_json['id']).to eq(team_id)
    expect(get_json['name']).to eq('Argentina')
    expect(get_json['key']).to eq('argentina')

    # Updates the team
    put "/api/v1/teams/#{team_id}", name: 'Arg'
    response.status.should eql(200)
    put_json = JSON.parse(response.body)
    expect(put_json['id']).to eq(team_id)
    expect(put_json['name']).to eq('Arg')
    expect(put_json['key']).to eq('argentina')
  end

  it "doesn't allow to create a Team with same key as existing one" do
    # Create team
    post '/api/v1/teams', name: 'Argentina', key: 'argentina'
    response.status.should eql(201)

    post '/api/v1/teams', name: 'Argentina2', key: 'argentina'
    response.status.should eql(422)
    post_json = JSON.parse(response.body)
    expect(post_json.keys.size).to eq(1)
    expect(post_json.keys.include?('key')).to be true
  end

  it "doesn't allow to create a Team with same name as existing one" do
    # Create team
    post '/api/v1/teams', name: 'Argentina', key: 'argentina'
    response.status.should eql(201)

    post '/api/v1/teams', name: 'Argentina', key: 'argentina2'
    response.status.should eql(422)
    post_json = JSON.parse(response.body)
    expect(post_json.keys.size).to eq(1)
    expect(post_json.keys.include?('name')).to be true
  end

  it "doesn't allow to create a Team with same key and name as existing one" do
    # Create team
    post '/api/v1/teams', name: 'Argentina', key: 'argentina'
    response.status.should eql(201)

    post '/api/v1/teams', name: 'Argentina', key: 'argentina'
    response.status.should eql(422)
    post_json = JSON.parse(response.body)
    expect(post_json.keys.size).to eq(2)
    expect(post_json.keys.include?('key')).to be true
    expect(post_json.keys.include?('name')).to be true
  end

  it "doesn't allow to create a Team without key" do
    # Create team
    post '/api/v1/teams', name: 'Argentina'
    response.status.should eql(422)
    post_json = JSON.parse(response.body)
    expect(post_json.keys.size).to eq(1)
    expect(post_json.keys.include?('key')).to be true
  end

  it "doesn't allow to create a Team without name" do
    # Create team
    post '/api/v1/teams', key: 'argentina'
    response.status.should eql(422)
    post_json = JSON.parse(response.body)
    expect(post_json.keys.size).to eq(1)
    expect(post_json.keys.include?('name')).to be true
  end

end
