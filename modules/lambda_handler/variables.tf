variable "region" {
  default = "us-east-1"
  type    = string
}
variable "accountId" {
    description = "AWS account id"
}
variable "policy_name" {
    description = "Name of the speaker_lambda policy"
    default     = "speaker_lambda_policy"
}

variable "lambda_name" {
    description = "Name of the lambda function"
    default     = "speaker_lambda"
}

variable "policy_description" {
    description = "Description of the speaker_lambda policy"
    default     = "Policy for the speaker_lambda"

}

variable "speaker_api" {
  description = "Base endpoint name" 
}

variable "POLLY_LANGUAGE_CODE" {
  description = "Language code for Polly"
  validation {
    condition = contains(["arb","cmn-CN","cy-GB","da-DK","de-DE","en-AU","en-GB",
    "en-GB-WLS","en-IN","en-US","es-ES","es-MX","es-US","fr-CA","fr-FR","is-IS",
    "it-IT","ja-JP","hi-IN","ko-KR","nb-NO","nl-NL","pl-PL","pt-BR","pt-PT","ro-RO",
    "ru-RU","sv-SE","tr-TR","en-NZ","en-ZA","ca-ES","de-AT","yue-CN","ar-AE","fi-FI",
    "en-IE","nl-BE","fr-BE"], var.POLLY_LANGUAGE_CODE)
    error_message = "Invalid language code for Polly"
  }
}

variable "POLLY_VOICE_ID" {
  description = "Voice ID for Polly"
  validation {
    condition = contains(["Aditi", "Amy", "Astrid", "Bianca", "Brian", "Camila", "Carla", "Carmen", 
    "Celine", "Chantal", "Conchita", "Cristiano", "Dora", "Emma", "Enrique", 
    "Ewa", "Filiz", "Geraint", "Giorgio", "Gwyneth", "Hans", "Ines", "Ivy", 
    "Jacek", "Jan", "Joanna", "Joey", "Justin", "Karl", "Kendra", "Kimberly", 
    "Lea", "Liv", "Lotte", "Lucia", "Lupe", "Mads", "Maja", "Marlene", 
    "Mathieu", "Matthew", "Maxim", "Mia", "Miguel", "Mizuki", "Naja", "Nicole", 
    "Olivia", "Penelope", "Raveena", "Ricardo", "Ruben", "Russell", "Salli", 
    "Seoyeon", "Takumi", "Tatyana", "Vicki", "Vitoria", "Zeina", "Zhiyu"], var.POLLY_VOICE_ID)
    error_message = "Invalid voice ID for Polly"
  }
}
variable "lambda_handler" {
  description = "filename.function_name for lambda handler"
  default     = "lambda_function.lambda_handler"
}
variable "lambda_runtime" {
  description = "Runtime for lambda function"
  default     = "python3.12"
}
variable "POLLY_ENGINE_TYPE" {
  description = "Engine type for Polly"
    validation {
        condition = contains(["standard", "neural"], var.POLLY_ENGINE_TYPE)
        error_message = "Invalid engine type for Polly"
    }
}
variable "POLLY_OUTPUT_FORMAT" {
  description = "Output format for Polly"
  validation {
    condition = contains(["mp3", "json", "ogg_vorbis", "pcm"], var.POLLY_OUTPUT_FORMAT)
    error_message = "Invalid output format for Polly"
  }
}
variable "lambda_polly_policy_name" {
  description = "Policy for the lambda function"
}
variable "lambda_iam_role_name" {
  description = "Name of the lambda iam role"  
}