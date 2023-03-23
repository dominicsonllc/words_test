require 'minitest/autorun'
require_relative '../engine'

class EngineTest < MiniTest::Unit::TestCase

  def setup
    @test = Engine.new'test/files/list'
  end

  def test_initialize
    assert_equal %w{arrows carrots give}, @test.words
  end

  def test_word_pass
    assert @test.nonce?('give')
  end

  def test_word_pass_for_sequence_found
    assert_equal false, @test.nonce?('arro')
  end

  def test_process
    expected = { carr: 'carrots',
                 give: 'give',
                 rots: 'carrots',
                 rows: 'arrows',
                 rrot: 'carrots',
                 rrow: 'arrows' }.sort.to_h
    assert_equal expected, @test.process.sort.to_h
  end

end