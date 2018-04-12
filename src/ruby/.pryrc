require 'demo'

client = Demo::Echo::Service.rpc_stub_class.new('echo.demo.svc:50051', :this_channel_is_insecure)

puts "starting with a default client configured"
puts """
try some simple messages like:
  client.basic(Demo::EchoMessage.new(contents: 'hello'))
  client.stream_from_client([Demo::EchoMessage.new(contents:'hello'), Demo::EchoMessage.new(contents:'world')])
  client.stream_from_server(Demo::EchoMessage.new(contents:'hello'))
  client.stream_both_ways([Demo::EchoMessage.new(contents:'hello'), Demo::EchoMessage.new(contents:'world')])
"""