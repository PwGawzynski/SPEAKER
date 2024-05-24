locals {
    multipart_model = file("${path.module}/models/multipart_form_data.json")
    mpeg_model = file("${path.module}/models/audio_mpeg.json")
}

resource "aws_api_gateway_model" "mpeg" {
  rest_api_id  = aws_api_gateway_rest_api.speaker_gateway.id
  name         = var.mpeg_model_name
  description  = var.mpeg_model_description
  content_type = var.mpeg_model_content_type
  schema = local.mpeg_model
}

resource "aws_api_gateway_model" "response_model" {
  rest_api_id  = aws_api_gateway_rest_api.speaker_gateway.id
  name         = var.multipart_model_name
  description  = var.multipart_model_description
  content_type = var.multipart_model_content_type
  schema = local.multipart_model
}