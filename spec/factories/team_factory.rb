FactoryGirl.define do
  factory :local_team, class: 'Team' do
    name "Local team"
    key "local"
  end

  factory :visitor_team, class: 'Team' do
    name "Visitor team"
    key "visitor"
  end
end