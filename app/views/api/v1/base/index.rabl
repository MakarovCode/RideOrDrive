object false

node :status do
  @handler.response[:status]
end

node :message do
  @handler.response[:message]
end

unless @data.nil?
  node :data do
    @data
  end
end
