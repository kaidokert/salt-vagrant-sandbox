Salt master/minion boxes with ubuntu.
Using gitfs as Salt root

vagrant ssh master , sudo su ubuntu

salt-key -A # accept all keys

salt '*' state.highstate # test install packages

salt '*' pkg.list_upgrades && pkg.upgrade
