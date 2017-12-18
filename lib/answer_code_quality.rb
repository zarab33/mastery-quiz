require "rubocop_execution"
require "answer_location"

def assert_acceptable_code_quality(spec_path)
  answer_code_quality = AnswerCodeQuality.new(
    RubocopExecution.new(
      AnswerLocation.new(spec_path)))
  expect(answer_code_quality.acceptable?).to eq(true),
                                             answer_code_quality.problems
end

class AnswerCodeQuality
  def initialize(rubocop_execution)
    @rubocop_execution = rubocop_execution
  end

  def acceptable?
    rubocop_execution.successful?
  end

  def problems
    rubocop_execution.problems
  end

  private

  attr_reader :rubocop_execution
end
