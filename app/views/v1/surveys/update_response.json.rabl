node do
  if @message.has_key?(:error)
    { :http_status_code => @message[:status], :error => @message[:error]}
  else
    { :http_status_code => @message[:status], :success => @message[:success] }
  end
end
