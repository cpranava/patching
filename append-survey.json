import json
import sys
data=sys.stdin.read()
newlist=data.split('\n')
newlist=newlist[:-1]
finallist=[]
for i in range(len(newlist)/3):
    finallist.append(newlist[i] + ' | ' + newlist[i+4] + ' | ' + newlist[i+8])
finallist = "\n".join(finallist)
with open('/tmp/survey-form.json') as outfile:
    json_survey = json.load(outfile)
json_survey["spec'].pop()
json_survey["spec"].append({"question_description": "Select the list of VMs to be deleted", "default": "", "min":"null", "max":"null", "choices": finallist.replace('\\n', '\n'), "variable": "vm_name", "question_name": "VM names", "type": "multiplechoice", "required": "true"})
test = json.dumps(json_survey)
