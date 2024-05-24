import json
import base64
import boto3
import os
from multipart_handler import get_text


VOICE_ID = os.getenv('VOICE_ID', 'Joanna')
LANGUAGE_CODE = os.getenv('LANGUAGE_CODE', 'en-US')
ENGINE_TYPE = os.getenv('ENGINE_TYPE', 'standard')
OUTPUT_FORMAT = os.getenv('OUTPUT_FORMAT', 'mp3')

TEXT_NOT_FOUND_RESPONSE = {'message': 'Text field not found in request body, but is required'}


def lambda_handler(event, context):
        #get parsed body from event 
        body = event['body-json']
        
        #get text from body
        text = get_text(body)

        if not text:
            return {
                'statusCode': 400,
                'body': json.dumps(TEXT_NOT_FOUND_RESPONSE)
            }
        
        polly_client = boto3.client('polly')
        response = polly_client.synthesize_speech(VoiceId=VOICE_ID,
                OutputFormat=OUTPUT_FORMAT, 
                LanguageCode = LANGUAGE_CODE,
                Text = text,
                Engine = ENGINE_TYPE,)
        
        return base64.b64encode(response['AudioStream'].read())
    