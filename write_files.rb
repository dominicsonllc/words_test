class Hash

  def to_sequences_file
    # Task: The sequences file should contain every unique sequence of four letters that are unique and appear in exactly one word of the dictionary file.
    write_file self.keys, 'sequences'
  end

  def to_words_file
    # Task: The words file should contain the corresponding words that contain the sequence, in the same order, again one per line.
    write_file self.values, 'words'
  end

  private

  def write_file _array, type
    values = _array.map(&:to_s)
    file_output = File.expand_path "files/#{type}"
    File.open(file_output, "w") do |line|
      values.each { |i| line.puts i }
    end
   file_output
  end

end