# Kolide API + Ansible

## Python Kolide client
1. `virtualenv -p python3 venv`
1. `source venv/bin/activate`
1. `pip3 install -r requirements.txt`

### Get results of query
1. `python3 kolide_websocket_client.py --campaign_id <X>`

### Create a query and wait for results
1. `python3 kolide_websocket_client.py`

## Supported versions and OSes
* `Kolide version 3.1.0`
* `Osquery version 4.5.1`
* `Ubuntu 20.04 64-bit`
* `Ansible v2.11+`

## References
### Kolide/Osquery
* [Downloading & Installing Osquery](https://osquery.io/downloads/official/4.5.1)
* [CptOfEvilMinions/osquerey-file-carve-server/conf/osquery/osquery-NO_MUTUAL_TLS.flags](https://github.com/CptOfEvilMinions/osquerey-file-carve-server/blob/master/conf/osquery/osquery-NO_MUTUAL_TLS.flags)
* [CptOfEvilMinions/BlogProjects/red_team_series/ansible_initial_access/windows/hosts](https://github.com/CptOfEvilMinions/BlogProjects/blob/master/red_team_series/ansible_initial_access/windows/hosts)
* []()
* []()

### Ansible
* [ansible.builtin.apt_key – Add or remove an apt key](https://docs.ansible.com/ansible/latest/collections/ansible/builtin/apt_key_module.html)
* [ansible.builtin.apt_repository – Add and remove APT repositories](https://docs.ansible.com/ansible/latest/collections/ansible/builtin/apt_repository_module.html)
* [ansible.builtin.apt – Manages apt-packages](https://docs.ansible.com/ansible/latest/collections/ansible/builtin/apt_module.html)
* [Ansible - Conditionals](https://docs.ansible.com/ansible/2.3/playbooks_conditionals.html#id5)
* [Write variable to a file in Ansible](https://stackoverflow.com/questions/26638180/write-variable-to-a-file-in-ansible)
* [ansible.windows.win_service – Manage and query Windows services](https://docs.ansible.com/ansible/latest/collections/ansible/windows/win_service_module.html)
* [ansible.windows.win_template – Template a file out to a remote server](https://docs.ansible.com/ansible/latest/collections/ansible/windows/win_template_module.html)
* [win_package – Installs/uninstalls an installable package](https://docs.ansible.com/ansible/2.8/modules/win_package_module.html)
* [Ansible, Windows and PowerShell: the Basics – Part 13, Environment Variables](https://www.jonathanmedd.net/2020/01/ansible-windows-and-powershell-the-basics-part-13-environment-variables.html)
* [ansible.windows.win_get_url – Downloads file from HTTP, HTTPS, or FTP to node](https://docs.ansible.com/ansible/latest/collections/ansible/windows/win_get_url_module.html)
* [Controlling where tasks run: delegation and local actions](https://docs.ansible.com/ansible/latest/user_guide/playbooks_delegation.html)
* []()
* []()

### Python
* [Reading and Writing YAML to a File in Python](https://stackabuse.com/reading-and-writing-yaml-to-a-file-in-python/)
* [How can I print literal curly-brace characters in python string and also use .format on it?](https://stackoverflow.com/questions/5466451/how-can-i-print-literal-curly-brace-characters-in-python-string-and-also-use-fo)
* [Suppress InsecureRequestWarning: Unverified HTTPS request is being made in Python2.6](https://stackoverflow.com/questions/27981545/suppress-insecurerequestwarning-unverified-https-request-is-being-made-in-pytho)
* [Why dict.get(key) instead of dict[key]?](https://stackoverflow.com/questions/11041405/why-dict-getkey-instead-of-dictkey)
* [Variable in Async function not re-evaluated in while-True loop](https://stackoverflow.com/questions/50746986/variable-in-async-function-not-re-evaluated-in-while-true-loop)
* [Github - websocket-client/websocket-client](https://github.com/websocket-client/websocket-client)
* [Github - Consumer and Producer both in code sample #152](https://github.com/aaugustin/websockets/issues/152)
* [StacOverFlow - Is there a WebSocket client implemented for Python? [closed]](https://stackoverflow.com/questions/3142705/is-there-a-websocket-client-implemented-for-python)
* [How to create Python secure websocket client request?](https://stackoverflow.com/questions/46852066/how-to-create-python-secure-websocket-client-request/46906266)
* [Github - aaugustin/websockets/example/client.py ](https://github.com/aaugustin/websockets/blob/master/example/client.py)
* [Python websockets](https://websockets.readthedocs.io/en/stable/)
* [StackOverFlow - What is a good practice to check if an environmental variable exists or not?](https://stackoverflow.com/questions/40697845/what-is-a-good-practice-to-check-if-an-environmental-variable-exists-or-not/40698307)
* [StackOverFlow - How to get the home directory in Python?](https://stackoverflow.com/questions/4028904/how-to-get-the-home-directory-in-python)
* [Python Check If File or Directory Exists](https://www.guru99.com/python-check-if-file-exists.html)
* [Python String join() Method](https://www.w3schools.com/python/ref_string_join.asp)
* [Getting User Input in Python](https://stackabuse.com/getting-user-input-in-python/)
* []()
* []()
* []()
* []()
