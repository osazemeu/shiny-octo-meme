class FileValidator < ActiveModel::EachValidator
  PERMITTED_CONTENT_TYPES = [
    "application/pdf",
    "image/jpeg",
    "image/png",
  ].freeze

  MAX_SIZE = 100000

  def validate_each(record, attribute, value)
    if value.attached?
      record.errors.add(attribute, "has wrong format") unless value.attachment.blob.content_type.in?(PERMITTED_CONTENT_TYPES)
      record.errors.add(attribute, "has invalid filesize") unless value.blob.byte_size < MAX_SIZE
      value.purge_later unless record.errors.messages.blank?
    end
  end
end
