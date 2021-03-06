import json
import sys
import requests

ANSIBLE_HOST_IP=sys.argv[2]
ANSIBLE_JOB_TEMPLATE=34
ANSIBLE_USERNAME=sys.argv[3]
ANSIBLE_PASSWORD=sys.argv[4]

#Load
finallist = list(sys.argv[1].replace('[','').replace(']','').split(','))
final_list_string = "\n".join(finallist)

#Initialize json
json_survey_string = '{ "description": "", "name": "", "spec": [] }'
json_survey = json.loads(json_survey_string)

#Create final survey value
json_survey["spec"].append({"question_description": "Select the list of VMs to be deleted", "default": "", "min": None, "max": None, "choices": final_list_string.replace('\\n', '\n'), "variable": "vm_name", "question_name": "VM names", "type": "multiselect", "required": True})

headers = {
    'content-type': 'application/json',
}
response = requests.post('https://{}/api/v2/job_templates/{}/survey_spec/'.format(ANSIBLE_HOST_IP, ANSIBLE_JOB_TEMPLATE), headers=headers, data=json.dumps(json_survey), verify=False, auth=(ANSIBLE_USERNAME, ANSIBLE_PASSWORD))
