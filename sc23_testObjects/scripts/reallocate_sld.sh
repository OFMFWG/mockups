#!/bin/bash

#1) patch Connection 13 by sending a PATCH request to /Fabrics/CXL/Connections/13 with body of file C13_patch.json
curl -X PATCH -H "Content-Type: application/json" \
        -d @../C13_patch.json \
        http://127.0.0.1:5000/redfish/v1/Fabrics/CXL/Connections/13

#2) post a new Connection 14 by sending a POST request to /Fabrics/CXL/Connections/14 with body of file C14_post.json
curl -X POST -H "Content-Type: application/json" \
        -d @../C14_post.json \
        http://127.0.0.1:5000/redfish/v1/Fabrics/CXL/Connections

#3) patch the Endpoint T4 to update the Connection link by sending a PATCH request to /Fabrics/CXL/Endpoints/T4 with body of file T4_patch.json
curl -X PATCH -H "Content-Type: application/json" \
        -d @../T4_patch.json \
        http://127.0.0.1:5000/redfish/v1/Fabrics/CXL/Endpoints/T4