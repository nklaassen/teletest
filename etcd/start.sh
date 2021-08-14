#!/bin/sh

export ETCD_ENABLE_V2=true
export ETCDCTL_API=2

etcd -v --name test0 --data-dir test0 --client-cert-auth \
	--trusted-ca-file=../certs/minica.pem \
	--cert-file=../certs/etcd/cert.pem \
	--key-file=../certs/etcd/key.pem \
	--advertise-client-urls https://127.0.0.1:2379 \
	--listen-client-urls https://127.0.0.1:2379
