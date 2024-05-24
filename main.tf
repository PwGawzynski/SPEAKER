terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.49"
    }
  }
  required_version = ">= 1.8.3"
}

module "speaker_gateway" {
  source                    = "./modules/api_gateway"
  gateway_name              = var.gateway_name
  spaker_api_path_name      = var.spaker_api_path_name
  spaker_speak_path_name    = var.spaker_speak_path_name
  speaker_speak_http_method = var.speaker_speak_http_method
  speaker_lambda = module.lambda_handler_function.speaker_lambda
  integration_http_method = var.integration_http_method
    integration_type = var.integration_type
    multipart_model_name = var.multipart_model_name 
    mpeg_model_name = var.mpeg_model_name
    mpeg_model_description = var.mpeg_model_description
    mpeg_model_content_type = var.mpeg_model_content_type   
    multipart_model_description = var.multipart_model_description
    multipart_model_content_type = var.multipart_model_content_type
    stage_name = var.stage_name
}
module "lambda_handler_function" {
  source    = "./modules/lambda_handler"
  region    = var.region
  accountId = var.accountId
  speaker_api = module.speaker_gateway
  POLLY_LANGUAGE_CODE = var.POLLY_LANGUAGE_CODE
  POLLY_VOICE_ID = var.POLLY_VOICE_ID
  POLLY_ENGINE_TYPE = var.POLLY_ENGINE_TYPE
    POLLY_OUTPUT_FORMAT = var.POLLY_OUTPUT_FORMAT 
    lambda_polly_policy_name = var.lambda_polly_policy_name
    lambda_iam_role_name = var.lambda_iam_role_name
}