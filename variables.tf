variable "region" {
  default = "us-east-1"
  type    = string
}
variable "gateway_name" {
  description = "Name of api gateway"
  default     = "speaker_api_gateway"
}

variable "spaker_api_path_name" {
  default     = "speaker"
  description = "Base endpoint name"
}

variable "spaker_speak_path_name" {
  default     = "speak"
  description = "Name of the endpoint used to process text to speach"
}

variable "speaker_speak_http_method" {
  default     = "POST"
  description = "Http method used with speak endpoint"
}
variable "accountId" {
  description = "AWS account id"
}

variable "POLLY_LANGUAGE_CODE" {
  description = "Language code for Polly"
  default     = "en-US"
}

variable "POLLY_VOICE_ID" {
  description = "Voice ID for Polly"
  default     = "Joanna"
}

variable "integration_http_method" {
    description = "Http method used with integration"
    default = "POST"
}
variable "integration_type" {
    description = "Type of integration"
    default = "AWS"
}
variable "multipart_model_name" {
  description = "Name of multipart model"
  default     = "multipart"
}
variable "mpeg_model_name" {
  description = "Name of mpeg model"
  default     = "mpeg"
}
variable "mpeg_model_description" {
  description = "Description of mpeg model"
  default     = "Mpeg model for the speaker api"
}
variable "mpeg_model_content_type" {
  description = "Content type of mpeg model"
  default     = "audio/mpeg"
}

variable "multipart_model_description" {
  description = "Description of multipart model"
  default     = "Multipart model for the speaker api"
}
variable "multipart_model_content_type" {
  description = "Content type of multipart model"
  default     = "multipart/form-data"
}
variable "stage_name" {
  description = "Name of the stage"
  default     = "spaker_api_stage"
}
variable "POLLY_ENGINE_TYPE" {
  description = "Engine type for Polly"
  default     = "standard"
}
variable "POLLY_OUTPUT_FORMAT" {
  description = "Output format for Polly"
  default     = "mp3"
}
variable "lambda_polly_policy_name" {
  description = "Policy for the lambda function"
  default     = "lambda_polly_access_policy"
}
variable "lambda_iam_role_name" {
  description = "Name of the lambda iam role"
  default     = "speaker_lambda_iam_role"
}