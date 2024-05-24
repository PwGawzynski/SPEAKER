resource "aws_api_gateway_stage" "spaker_api_stage" {
  deployment_id = aws_api_gateway_deployment.speaker_api_deployment.id
  rest_api_id   = aws_api_gateway_rest_api.speaker_gateway.id
  stage_name    = var.stage_name
}