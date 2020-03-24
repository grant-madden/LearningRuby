require_relative './setup'

RSpec.describe CarModel do
  subject { CarModel.new }

  it "should allow us to select a model" do
    subject.select_model("E")

    expect(subject.id).to eq("E")
  end

  it "should give us E's price" do
    subject.select_model("E")

    expect(subject.price).to eq(10_000)
  end

  it "should give us 0 when no model is select" do
    subject.select_model(nil)

    expect(subject.price).to eq(0)
  end
end