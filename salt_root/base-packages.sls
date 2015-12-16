pkg-present-python:
  pkg.installed:
    - pkgs:
      - python-boto
      - python-pip

tools-installed:
  pkg.installed:
    - pkgs:
      - htop
      - sl
