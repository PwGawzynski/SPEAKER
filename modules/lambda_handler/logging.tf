locals {
  lambda_logging_policy = file("${path.module}/policies/logging.json")
}

resource "aws_cloudwatch_log_group" "example" {
  name              = "/aws/lambda/${var.lambda_name}"
  retention_in_days = 14
}

resource "aws_iam_policy" "lambda_logging" {
  name        = var.policy_name
  path        = "/"
  description = var.policy_description
  policy = local.lambda_logging_policy
}

resource "aws_iam_role_policy_attachment" "lambda_logs" {
  role       = aws_iam_role.lambda_iam_role.name
  policy_arn = aws_iam_policy.lambda_logging.arn
}