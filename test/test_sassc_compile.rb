# frozen_string_literal: true

require "minitest/autorun"
require "sassc"
require "pathname"

class TestSassCCompile < Minitest::Test
  def setup
    @css_path = Pathname.new(File.expand_path("../vendor/assets/stylesheets/tom-select-rails/css/tom-select.css", __dir__)).cleanpath
    raise "missing css file: #{@css_path}" unless @css_path.file?
    @css = @css_path.read
  end

  def test_compile_tom_select_css_with_sassc
    # Use a basic SassC::Engine to simulate compilation; this should raise
    assert_silent do
      SassC::Engine.new(@css, syntax: :css).render
    end

    # match the core error text; different SassC versions may word it slightly
    # assert_match(/not a number/i, e.message)
  end

  def test_scss_max_var_triggers_sassc_syntax_error
    scss = <<~SCSS
      .style-name {
        right: max(var(--ts-pr-caret), 8px);
      }
    SCSS

    # Older versions of libsass/sassc will try to evaluate `max()` and will
    # raise a SassC::SyntaxError when it encounters `var(...)` which is not a
    # numeric value. This test reproduces that behavior by compiling as SCSS.
    assert_raises(SassC::SyntaxError, "Expected SassC::SyntaxError when compiling max(var(...)) as SCSS") do
      SassC::Engine.new(scss, syntax: :scss).render
    end
  end
end
