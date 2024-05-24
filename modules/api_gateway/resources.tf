resource "aws_api_gateway_resource" "spaker_api" {
  rest_api_id = aws_api_gateway_rest_api.speaker_gateway.id
  parent_id = aws_api_gateway_rest_api.speaker_gateway.root_resource_id
  path_part = var.spaker_api_path_name
}

resource "aws_api_gateway_resource" "spaker_speak" {
  rest_api_id = aws_api_gateway_rest_api.speaker_gateway.id
  parent_id = aws_api_gateway_resource.spaker_api.id
  path_part = var.spaker_speak_path_name
}