require_relative './setup'

RSpec.describe CarPackage do
  let(:user_model) { CarModel.new("E") }
  subject { CarPackage.new(user_model) }

  it "should allow us to add an option by string" do
    subject.add_option("carplay")
    expect(subject.option_list.length).to eq(1)
    expect(subject.option_list.has_option_name?("CarPlay")).to eq(true)
  end

  it "should allow us to add multiple options and get total price" do
    subject.add_option("carplay")
    subject.add_option("leather seats")

    expect(subject.total_price).to eq(15_500)
  end
end