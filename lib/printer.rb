class Printer

  def file_exists_message
    "This file already exists. Do you want to (o)verwrite the file or (c)ancel the operation?"
  end

  def overwrite_message(file, key, date)
    "Created '#{file}' with the key #{key} and date #{date}."
  end

  def canceled_message
    "Operation Canceled!"
  end

  def options_message
    "Enter 'o' to overwrite, or 'c' to cancel."
  end
end
