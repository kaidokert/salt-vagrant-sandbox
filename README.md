Salt master/minion boxes with Ubuntu precise/trusty. Installs 2015.8 from official repos

State and pillar is configured through both git and filesystem

Bring up all three boxes

`vagrant up`

ssh into the master box

`vagrant ssh`

change to work under ubuntu username

`sudo su ubuntu`

Test highstate

`salt '*' state.highstate`

Do other things, like update out of date packages for instance

`salt '*' pkg.list_upgrades`

`salt '*' pkg.upgrade`
