#!/bin/bash
## This script is used to Generate the self signed Certificates and Keys
## 
## Useage:  
## $ generate_servercert_serverkey <common name>
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


#CA KEY informations
# By default the CA Certificate and Keys are assumed to use in the below names.
CA_KEY=${BASE}/ca-key.pem
CA_CERT=${BASE}/ca-cert.pem


# Output file Names
SERVER_REQ=${BASE}/server-req.pem
SERVER_CERT=${BASE}/server-cert.pem
SERVER_KEY=${BASE}/server-key.pem

# If argument is not given exit the script
if [ -z "$domain" ]
then
    echo "Argument not present."
    echo "Useage $0 [common name]"

    exit 99
fi

echo "Generating the Server Key and Server Certificate Signing Request for $commonname"
openssl req -newkey rsa:2048 -days 3600 -subj "/C=$country/ST=$state/L=$locality/O=$organization/OU=$organizationalunit/CN=$commonname/emailAddress=$email" -nodes -keyout ${SERVER_KEY} -out ${SERVER_REQ}
sleep 1
echo "Rekeying......"
openssl rsa -in ${SERVER_KEY} -out ${SERVER_KEY}
sleep 1
echo "Generating the Signed Server Key and Server Certificate for $commonname"
openssl x509 -req -in ${SERVER_REQ} -days 3600 -CA ${CA_CERT} -CAkey ${CA_KEY} -set_serial 01 -out ${SERVER_CERT}










