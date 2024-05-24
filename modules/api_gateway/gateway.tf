resource "aws_api_gateway_rest_api" "speaker_gateway" {
  name = var.gateway_name
  binary_media_types = [
    var.mpeg_model_content_type
  ]
}

