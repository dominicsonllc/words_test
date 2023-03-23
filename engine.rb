require_relative 'write_files'

LETTER_COUNT = 4

class Engine

  def self.run
    hash = Engine.new('words').process
    # Task: The program should generate two output files, "sequences" and "words".
    hash.to_sequences_file
    hash.to_words_file
  end

  attr_accessor :words, :word_pairs

  def initialize file
    self.word_pairs = {}
    self.words = []
    collect_qualifying_words_from_file(file)
  end

  def process
    steps_to_crawl.times { |i| calculate(i) }
    self.word_pairs
  end

  def nonce?(sequence)
    match_count = 0
    words.each do |w|
      match_count += 1 if w.match(sequence)
    end
    match_count == 1
  end

  private

  def collect_qualifying_words_from_file(file)
    File.readlines(file).each do |line|
      word = line.strip
      if word.size >= LETTER_COUNT &&
        # Task: Numbers and special characters should not create a unique sequence.
        word =~ /^[a-zA-Z]+$/

        # Task: Differences in casing should not reflect a unique sequence.
        self.words.push word.downcase
      end
    end
  end

  def calculate(current_letter_position)
    words.each do |word|
      sequence = word[current_letter_position, LETTER_COUNT]
      if sequence&.size == LETTER_COUNT && nonce?(sequence)
        self.word_pairs[sequence.to_sym] = word
        print_status(current_letter_position, sequence)
      end
    end
  end

  def print_status(pass_num, sequence)
    print "##{pass_num}/#{steps_to_crawl}: #{sequence}. "
  end

  def steps_to_crawl
    @c ||= words.max_by(&:length).size - LETTER_COUNT + 1
  end

end