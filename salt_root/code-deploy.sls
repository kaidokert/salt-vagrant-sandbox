code_virtualenv:
  virtualenv.managed:
    - name: /home/ubuntu/.virtualenvs/code-run
    - user: ubuntu
    - system_site_packages: False
    - requirements: salt://requirements-prod.txt

ubuntu_bashrc_file:
  file.blockreplace:
    - name: /home/ubuntu/.bashrc
    - marker_start: "# BLOCK TOP"
    - marker_end: "# BLOCK END"
    - content: '# here be dragons'
    - show_changes: True
    - append_if_not_found: True
