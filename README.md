## RHSM Subscription

Create a new Custom Credential type - Red Hat Subscription Manager.

> In Settings, select Custom Credentials Type

![custom-cred-type.png](https://www.ansible.com/hs-fs/hubfs/2017_Images/Blog/Tower%203.2%20-%20Custom%20Credentials/custom-cred-type.png?width=687&height=588&name=custom-cred-type.png)

### Input Configuration: 

```yaml
fields:
  - type: string
    id: username
    label: Subscription manager username
  - type: string
    id: password
    label: "Subscription manager password"
    secret: True
required:
  - username
  - password
```

### Injecter Configuration:

```yaml
extra_vars:
  rhsm_password: '{{ password }}'
  rhsm_username: '{{ username }}'
```


