def capture_standard_output(&block)
  original_stream = $stdout
  $stdout = mock = StringIO.new
  yield
  mock.string.chomp
ensure
  $stdout = original_stream
end