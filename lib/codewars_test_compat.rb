require "rspec/core"

module Test
  class << self
    # `options` is not used, but kept for backwards compatibility
    def expect(passed = nil, message = nil, options = nil)
      success = block_given? ? yield : !!passed
      return if success

      message ||= 'Value is not what was expected'
      # Requires RSpec 3.3+
      ex = RSpec::Expectations::ExpectationNotMetError.new(message)
      RSpec::Support.notify_failure(ex)
    end

    def expect_error(message = nil)
      yield
      Test.expect(false, message || 'Expected an error to be raised')
    rescue
    end

    def expect_no_error(message = nil)
      yield
    rescue => ex
      message ||= 'Unexpected error was raised'
      Test.expect(false, "#{message}: #{ex.message}")
    end

    # `options` is not used, but kept for backwards compatibility
    def assert_equals(actual, expected, msg = nil, options = nil)
      if actual != expected
        msg = msg ? msg + ' -  ' : ''
        message = "#{msg}Expected: #{expected.inspect}, instead got: #{actual.inspect}"
        Test.expect(false, message)
      end
    end

    # `options` is not used, but kept for backwards compatibility
    def assert_not_equals(actual, expected, msg = nil, options = nil)
      if actual == expected
        msg = msg ? msg + ' - ' : ''
        message = "#{msg}Not expected: #{actual.inspect}"
        Test.expect(false, message)
      end
    end

    # `options` is not used, but kept for backwards compatibility
    def assert_include(actual, expected, options = nil)
      unless actual.include?(expected)
        msg = msg ? msg + ' -  ' : ''
        message = "#{msg}Expected: #{actual.inspect} to include #{expected.inspect}"
        Test.expect(false, message)
      end
    end

    # `options` is not used, but kept for backwards compatibility
    def assert_not_include(actual, expected, options = nil)
      if actual.include?(expected)
        msg = msg ? msg + ' -  ' : ''
        message = "#{msg}Expected: #{actual.inspect} to not include #{expected.inspect}"
        Test.expect(false, message)
      end
    end

    def fail(msg = nil)
      Test.expect(false, msg)
    end

    def random_letter
      ('a'..'z').to_a.sample
    end

    def random_token
      rand(36**6).to_s(36)
    end

    def random_number
      rand(100)
    end
  end
end
