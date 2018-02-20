require 'rspec'

describe "when count_violations is run" do
  it "returns count of violations" do
    expect(ViolationAnalytics.count_violations).to eq()
  end
  it "prints out all violation types without duplication" do

    expect(ViolationAnalytics.violation_types.count).to eq(0)
  end
end
