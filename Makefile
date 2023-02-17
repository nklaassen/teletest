auth1: export SOFTHSM2_TOKEN = test1
auth1:
	./current/teleport start --diag-addr 127.0.0.1:3000 -c config/one-auth.yaml

auth2: export SOFTHSM2_TOKEN = test2
auth2:
	./current/teleport start -c config/one-auth-2.yaml

init-tokens:
	softhsm2-util --init-token --free --label test --pin password --so-pin password
	softhsm2-util --init-token --free --label test1 --pin password --so-pin password
	softhsm2-util --init-token --free --label test2 --pin password --so-pin password

proxy:
	./current/teleport start -c config/one-proxy.yaml

node:
	./current/teleport start -c config/one-node.yaml

node-iot:
	./current/teleport start -c config/one-node-iot.yaml

two-auth:
	./current/teleport start --diag-addr 127.0.0.1:3001 -c config/two-auth.yaml

two-proxy:
	./current/teleport start -c config/two-proxy.yaml

two-node:
	./current/teleport start -c config/two-node.yaml

two-node-iot:
	./current/teleport start -c config/two-node-iot.yaml

nic:
	./current/tctl -c config/one-auth.yaml users add nic --roles editor,access --logins nklaassen

clean:
	rm -rf data/* backend/* tokens/*
