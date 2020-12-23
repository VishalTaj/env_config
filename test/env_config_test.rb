require 'test_helper'

class EnvConfigTest < ActiveSupport::TestCase
  def test_that_it_has_a_version_number
    refute_nil ::EnvConfig::VERSION
  end

  def test_it_does_something_useful
    assert_equal 'World', ::Setting.hello
  end

  def test_if_accept_array
    assert_equal %w[test working], ::Setting.single
  end

  def test_if_accept_nested_array
    assert_equal %w[test working], ::Setting.nested[0].value
  end

  def test_if_env_priority
    assert_equal 'World', ::Setting.hello
  end

  def test_if_accept_non_env_key
    assert_equal 'yes', ::Setting.working
  end
end
