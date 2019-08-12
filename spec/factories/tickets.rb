FactoryBot.define do
  factory :ticket do
    train

    user

    trait :with_path do
      before(:create) do |t|
        t.train.route = create(:route, :with_railway_station)
        t.first_station = t.train.route.railway_stations.first
        t.last_station = t.train.route.railway_stations.last
      end
    end
  end
end
