#!/bin/sh
export SOFTHSM2_CONF=/Users/nklaassen/src/teletest/config/softhsm2.conf
export SOFTHSM2_PATH=/usr/local/lib/softhsm/libsofthsm2.so
export SOFTHSM2_PIN=password
export SOFTHSM2_TOKEN=test
export YUBIHSM_PKCS11_CONF=/Users/nklaassen/src/teletest/config/yubihsm_pkcs11.conf
export YUBIHSM_PKCS11_PATH=/usr/local/lib/pkcs11/yubihsm_pkcs11.dylib
