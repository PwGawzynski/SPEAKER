output "speaker_gateway" {
  description = "Speaker app gateway"
  value = aws_api_gateway_rest_api.speaker_gateway
}
output "speaker_speak_http_method" {
    description = "Http method used with speak endpoint"
    value = aws_api_gateway_method.speaker_speak_post
}
output "speaker_speak_resource" {
    description = "Speaker app speak post method"
    value = aws_api_gateway_resource.spaker_speak
  
}