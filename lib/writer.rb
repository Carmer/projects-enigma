class Writer

  def write_to_file(message, altered_message)
    output         = File.open(message, "w")
    altered_text = altered_message.join
    output.write(altered_text)
    output.close
  end

  def file_exists?(message)
    File.exist?(message)
  end
end
