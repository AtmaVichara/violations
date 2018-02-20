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

end
