data "archive_file" "zip_lambda_files" {
  type = "zip"
  source_dir = "${path.module}/lambda_code"
  output_path = "${path.module}/lambda_dist/lambda.zip"
}

resource "aws_lambda_function" "speaker_lambda" {
  filename      = "${path.module}/lambda_dist/lambda.zip"
  function_name = var.lambda_name
  role          = aws_iam_role.lambda_iam_role.arn
  handler       = var.lambda_handler
  runtime       = var.lambda_runtime
  depends_on = [ 
    aws_iam_role_policy_attachment.lambda_logs,
    data.archive_file.zip_lambda_files
  ]
  environment {
    variables = {
      VOICE_ID = var.POLLY_VOICE_ID,
      LANGUAGE_CODE = var.POLLY_LANGUAGE_CODE,
    }
  }
  source_code_hash = filebase64sha256("${path.module}/lambda_dist/lambda.zip")
}
