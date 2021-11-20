#!/bin/bash
## This script is used to Generate the self signed Certificates and Keys
## 
## Useage:  
## $ generate_cacert_cakey.sh <common name>
## VERSION 1.0
## DATE: 20th November 2021
## Author: Nandhakumar Madheshwaran

BASE=`pwd`  # Files will be generated at current working directory
domain=$1
commonname=$domain

#Change to your company details
country="IN"
state="MH"
locality="Pune"
organization="Red Hat Inc"
organizationalunit="Support Delivery"
email="root@${commonname}"

# Output file Names
CA_KEY=${BASE}/ca-key.pem
CA_CERT=${BASE}/ca-cert.pem

# If argument is not given exit the script

if [ -z "$domain" ]
then
    echo "Argument not present."
    echo "Useage $0 [common name]"

    exit 99
fi

#echo "Generating key request for $commonname"
echo "Generating $CA_KEY for $commonname"

#Generate a CA key
openssl genrsa 2048 > $CA_KEY
sleep 2
echo "$CA_KEY successfully Generated"

#Generate CA Certificate
echo "Generating $CA_CERT for $commonname"
openssl req -new -x509 -nodes -days 3600 -subj "/C=$country/ST=$state/L=$locality/O=$organization/OU=$organizationalunit/CN=$commonname/emailAddress=$email" -key ca-key.pem -out ca-cert.pem
echo "$CA_CERT successfully Generated for $commonname"

