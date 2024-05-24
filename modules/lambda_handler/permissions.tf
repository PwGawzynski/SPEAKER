resource "aws_lambda_permission" "speaker_lambda_permission" {
  statement_id  = "AllowExecutionFromAPIGateway"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.speaker_lambda.function_name
  principal     = "apigateway.amazonaws.com"
  source_arn = "arn:aws:execute-api:${var.region}:${var.accountId}:${var.speaker_api.speaker_gateway.id}/*/${var.speaker_api.speaker_speak_http_method.http_method}${var.speaker_api.speaker_speak_resource.path}"
}