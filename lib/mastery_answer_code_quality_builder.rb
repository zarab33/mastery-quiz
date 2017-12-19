require "answer_location"
require "rubocop_execution"
require "answer_code_quality"

module MasteryAnswerCodeQualityBuilder
  def self.build(spec_path,
                 answer_location_class=AnswerLocation,
                 rubocop_execution_class=RubocopExecution,
                 answer_code_quality_class=AnswerCodeQuality)
    answer_code_quality_class.new(
      rubocop_execution_class.new(
        mastery_rubocop_config_path,
        answer_location_class.new(spec_path)))
  end

  private_class_method

  def self.mastery_rubocop_config_path
    File.absolute_path(
      File.join(
        File.dirname(__FILE__),
        "..",
        ".rubocop.yml"))
  end
end
