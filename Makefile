
auth1: export SOFTHSM2_TOKEN = test1
auth1:
	teleport start -c config/one-auth-1.yaml

auth2: export SOFTHSM2_TOKEN = test2
auth2:
	teleport start -c config/one-auth-2.yaml

init-tokens:
	softhsm2-util --init-token --free --label test --pin password --so-pin password
	softhsm2-util --init-token --free --label test1 --pin password --so-pin password
	softhsm2-util --init-token --free --label test2 --pin password --so-pin password

proxy:
	teleport start -c config/one-proxy-1.yaml

clean:
	rm -rf data/* backend/* tokens/*
