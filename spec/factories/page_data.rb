FactoryGirl.define do
  factory :old_record, class: "PageDatum" do
    title "Old Record"
    price_gross "43,2"
    price_vat "5,3"
    price_net "99,9"
    created_at 3.days.ago
    association :page, factory: :books_hardcover
  end

  factory :new_record, class: "PageDatum" do
    title "New Record"
    price_gross "42,2"
    price_vat "5,4"
    price_net "100"
    association :page, factory: :books_hardcover
  end
end
