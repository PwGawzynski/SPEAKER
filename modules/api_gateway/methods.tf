resource "aws_api_gateway_method" "speaker_speak_post" {
    depends_on = [aws_api_gateway_model.response_model]
    rest_api_id = aws_api_gateway_rest_api.speaker_gateway.id
    resource_id = aws_api_gateway_resource.spaker_speak.id
    http_method = var.integration_http_method
    authorization = "NONE"
    request_models = {
    "application/json" = var.multipart_model_name
  }
  
}