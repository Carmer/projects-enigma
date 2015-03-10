require './test/test_helper'
require './lib/printer'

class PrinterTest < Minitest::Test

  def setup
    @printer = Printer.new
  end

  def test_it_can_print_message_for_file_existing
    assert_equal "This file already exists. Do you want to (o)verwrite the file or (c)ancel the operation?", @printer.file_exists_message
  end

  def test_it_can_print_message_for_overwriting_file
    assert_equal "Created 'file.txt' with the key 55555 and date 031015.", @printer.overwrite_message("file.txt", "55555", "031015")
  end

  def test_it_can_print_message_to_cancel
    assert_equal "Operation Canceled!", @printer.canceled_message
  end

  def test_it_can_print_options_message
    assert_equal "Enter 'o' to overwrite, or 'c' to cancel.", @printer.options_message
  end
end
