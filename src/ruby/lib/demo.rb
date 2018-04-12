Dir[File.join(File.dirname(__FILE__), '*services_pb.rb')].each do |file|
  require file
end

module Demo
end