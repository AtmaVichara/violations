require 'rspec'
require './lib/violation_analytics.rb'
require './lib/violations.rb'

describe "when count_violations is run" do
  before(:each) do
    ViolationAnalytics.parse_csv
  end
  it "returns count of violations" do
    expect(ViolationAnalytics.count_violations.count).to eq(43)
    expect(ViolationAnalytics.count_violations).to include("Unsanitary conditions, not specified: 74")
  end
  it "prints out all violation types without duplication" do

    expect(ViolationAnalytics.violation_types.count).to eq(43)
  end
end
