Salt master/minion boxes with ubuntu.
Using gitfs as Salt root

ssh into the master box
`vagrant ssh master`

change to work under ubuntu username

`sudo su ubuntu` #

accept all keys

`salt-key -A`

test install packages

`salt '*' state.highstate`

Update out of date packages

`salt '*' pkg.list_upgrades`

`salt '*' pkg.upgrade`
