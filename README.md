# `codewars_test_compat`

Provides methods from the deprecated custom test framework to be used with RSpec.

The goal of this gem is to ease the language version upgrade.
New tests should not use this.

## Usage

`spec/spec_helper.rb`

```ruby
# frozen_string_literal: true
require "codewars_test_compat" # Defines `Test.*`
```

Tests written with the deprecated custom test framework:

```ruby
# spec/example_spec.rb
describe "Example Group" do
  it "should have the same syntax" do
    Test.assert_equals(add(1, 1), 2)
  end
end
```

```bash
bundle exec rspec --require spec_helper
```
