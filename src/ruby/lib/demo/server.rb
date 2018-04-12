module Demo
  class Server < Demo::Echo::Service
    def basic(request, _call)
      Demo::EchoMessage.new(contents: request.contents)
    end

    def stream_from_client(call)
      response = call.each_remote_read
                     .each
                     .reduce('') do |resp, req|
                       resp + req.contents
                     end

      Demo::EchoMessage.new(contents: response)
    end

    def stream_from_server(request, _call)
      [ Demo::EchoMessage.new(contents: request.contents),
        Demo::EchoMessage.new(contents: request.contents) ]
    end

    def stream_both_ways(requests, call)
      call.each_remote_read
          .map do |request|
            Demo::EchoMessage.new(contents: request.contents)
          end
    end
  end
end