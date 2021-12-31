# frozen_string_literal: true

module GR
  class ParseHelper
    def self.sort_by(list:, field:)
      field = field.to_s.strip.downcase.to_sym
      list.sort_by { |c| c.instance_variable_get("@#{field}") }
    end

    def self.sanatize_code(code)
      return nil if code.nil? || code&.empty?

      code.to_s.strip.upcase
    end

    def self.sanatize_name(name)
      return nil if name.nil? || name&.empty?

      name.to_s.strip.delete_prefix('"').delete_suffix('"')
    end
  end
end
