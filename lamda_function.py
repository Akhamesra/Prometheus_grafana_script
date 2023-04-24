import boto3
import pprint
ssm_client = boto3.client('ssm', region_name="ap-south-1") # use region code in which you are working
response = ssm_client.send_command(
             InstanceIds=[
                "i-0837c305a05133d50" # use instance id on which you want to execute, even multiple is allowd
                     ],
             DocumentName="AWS-RunPowerShellScript",
             Parameters={
                'commands':[
                     'sudo systemctl stop node-exporter'
                       ]
                   },
               )
print(response)