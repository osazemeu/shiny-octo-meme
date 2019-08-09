class TagsValidator < ActiveModel::EachValidator
  REGEX_PATTERN = (/[\s\+\-]/).freeze

  def validate_each(record, attribute, value)
    record.errors.add("not an array") unless value.kind_of?(Array)

    value.each do |elem|
      record.errors.add "#{attribute} - #{elem}", "is not an acceptable character type" unless elem.index(REGEX_PATTERN).nil?
    end
  end
end
