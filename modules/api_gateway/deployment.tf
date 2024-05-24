resource "aws_api_gateway_deployment" "speaker_api_deployment" {
  rest_api_id = aws_api_gateway_rest_api.speaker_gateway.id

  triggers = {
    redeployment = sha1(jsonencode([
      aws_api_gateway_rest_api.speaker_gateway.id,
      aws_api_gateway_method.speaker_speak_post,
      aws_api_gateway_integration.integration,
      aws_api_gateway_method_response.post-200,
      aws_api_gateway_integration_response.post-200-integration,
      aws_api_gateway_model.mpeg,
      aws_api_gateway_model.response_model,
    ]))
  }

  lifecycle {
    create_before_destroy = true
  }
}