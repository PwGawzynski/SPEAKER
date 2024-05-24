variable "gateway_name" {
  description = "Name of gateway"
}

variable "spaker_api_path_name" {
  default = "speaker"
  description = "Base endpoint name"
}

variable "spaker_speak_path_name" {
  default = "speak"
  description = "Name of the endpoint used to process text to speach"
}

variable "speaker_speak_http_method" {
  default = "POST"
  description = "Http method used with speak endpoint"
}

variable "speaker_lambda" {
    description = "Lambda function to be integrated with api gateway"
}

variable "integration_http_method" {
    description = "Http method used with integration"
}

variable "integration_type" {
    description = "Type of integration"
}
variable "multipart_model_name" {
  description = "Name of multipart model"
  validation {
    condition = can(regex("^[a-zA-Z]+$", var.multipart_model_name))
    error_message = "Multipart model name must contain only letters"
  }
}
variable "mpeg_model_name" {
  description = "Name of mpeg model"
  validation {
    condition = can(regex("^[a-zA-Z]+$", var.mpeg_model_name))
    error_message = "Mpeg model name must contain only letters"
  }
}
variable "mpeg_model_description" {
  description = "Description of mpeg model"
}
variable "mpeg_model_content_type" {
  description = "Content type of mpeg model"
}
variable "multipart_model_description" {
  description = "Description of multipart model"
}
variable "multipart_model_content_type" {
  description = "Content type of multipart model"
}
variable "stage_name" {
  description = "Name of the stage"
}