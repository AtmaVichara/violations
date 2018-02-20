require 'csv'
require 'lib/violation.rb'


class ViolationAnalytics

  attr_reader :violations

  def self.parse_csv(csv)
    @violations = []
    options = {headers: true, header_converters: :symbol }
    CSV.foreach('data/Violations-2012.csv', options) do |row|
      @violations << Violation.new(row)
    end
  end

  def self.violation_types
    @violations.map(:type).uniq
  end

end
