locals {
  lambda_polly_policy = file("${path.module}/policies/polly.json")
}

data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "lambda_iam_role" {
  name               = var.lambda_iam_role_name
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

resource "aws_iam_policy" "lambda_polly_policy" {
  name = var.lambda_polly_policy_name
  policy = local.lambda_polly_policy
}
resource "aws_iam_role_policy_attachment" "lambda_polly_policy_attachment" {
  policy_arn = aws_iam_policy.lambda_polly_policy.arn
  role      = aws_iam_role.lambda_iam_role.name
}