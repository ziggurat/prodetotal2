FactoryGirl.define do
	factory :competition do
    name "Test competition"
    start_date Time.now - 15.days
    end_date Time.now + 20.days
    archive false    
  end
end