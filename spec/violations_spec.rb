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
  it "grabs all violation types without duplication" do
    expect(ViolationAnalytics.violation_types.count).to eq(43)
  end
  it "prints out violations and counts" do
    expect(ViolationAnalytics.print_violation_counts.class).to eq(Array)
  end
  it "grabs earlist date for each violation" do
    expect(ViolationAnalytics.earliest_date.count).to eq(43)
    expect(ViolationAnalytics.earliest_date.first).to eq("Refuse Accumulation: Earliest Date: 2012-01-03 00:00:00")
  end
end
