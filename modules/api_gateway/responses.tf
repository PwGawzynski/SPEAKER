resource "aws_api_gateway_method_response" "post-200" {
  depends_on  = [aws_api_gateway_model.mpeg, aws_api_gateway_integration.integration]
  rest_api_id = aws_api_gateway_rest_api.speaker_gateway.id
  resource_id = aws_api_gateway_resource.spaker_speak.id
  http_method = aws_api_gateway_method.speaker_speak_post.http_method
  status_code = "200"

  response_parameters = {
    "method.response.header.Content-Type" = true
  }
  response_models = {
    "audio/mpeg" = var.mpeg_model_name
  }
}

resource "aws_api_gateway_integration_response" "post-200-integration" {
  depends_on  = [aws_api_gateway_method_response.post-200, aws_api_gateway_integration.integration]
  rest_api_id = aws_api_gateway_rest_api.speaker_gateway.id
  resource_id = aws_api_gateway_resource.spaker_speak.id
  http_method = aws_api_gateway_method.speaker_speak_post.http_method
  status_code = aws_api_gateway_method_response.post-200.status_code
}
