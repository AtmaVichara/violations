require 'csv'
require './lib/violations.rb'


class ViolationAnalytics

  attr_reader :violations

  def self.parse_csv
    @violations = []
    options = {headers: true, header_converters: :symbol }
    CSV.foreach('data/Violations-2012.csv', options) do |row|
      @violations << Violation.new(row)
    end
  end

  def self.violation_types
    @violations.map(&:violation_type).uniq
  end

  def self.count_violations
    violation_types.map do |type|
      count = @violations.find_all { |t| t.violation_type == type }.count
      "#{type}: #{count}"
    end
  end

  def self.print_violation_counts
    count_violations.each { |violations| p violations }
  end

  def self.earliest_date
    violation_types.map do |type|
      dates = @violations.find_all { |t| t.violation_type == type }.sort_by(&:date)
      "#{type}: Earliest Date: #{dates.first.date}"
    end
  end

  def self.print_earliest_dates
    earliest_date.each { |violation_dates| p violation_dates }
  end

  def self.latest_date
    violation_types.map do |type|
      dates = @violations.find_all { |t| t.violation_type == type }.sort_by(&:date)
      "#{type}: Latest Date: #{dates.reverse.first.date}"
    end
  end

  def self.print_latest_dates
    earliest_date.each { |violation_dates| p violation_dates }
  end

end
