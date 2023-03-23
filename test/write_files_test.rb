require 'minitest/autorun'
require_relative '../engine'
require_relative '../write_files'

class FileOutputer < MiniTest::Unit::TestCase

  def setup
    @app = Engine.new 'test/files/list'
  end

  def test_generate_to_sequences_file_content
    assert_equal @app.process.keys.sort,
                 [:carr, :give, :rots, :rows, :rrot, :rrow].sort
  end

  def test_generate_to_words_file_content
    assert_equal @app.process.values.sort,
                 [:carrots, :give, :carrots, :arrows, :carrots, :arrows].sort
  end

end

