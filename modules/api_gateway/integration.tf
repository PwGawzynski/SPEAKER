locals {
    multipart_template = templatefile("${path.module}/templates/multipart_template.tftpl", {})
}

resource "aws_api_gateway_integration" "integration" {
  rest_api_id             = aws_api_gateway_rest_api.speaker_gateway.id
  resource_id             = aws_api_gateway_resource.spaker_speak.id
  http_method             = aws_api_gateway_method.speaker_speak_post.http_method
  integration_http_method = var.integration_http_method
  type                    = var.integration_type
  uri                     = var.speaker_lambda.invoke_arn
    request_templates = {
        "multipart/form-data" = local.multipart_template
    }
}
