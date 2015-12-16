code_virtualenv:
  virtualenv.managed:
    - name: /home/ubuntu/.virtualenvs/code-run
    - user: ubuntu
    - system_site_packages: False
    - requirements: salt://requirements-prod.txt
