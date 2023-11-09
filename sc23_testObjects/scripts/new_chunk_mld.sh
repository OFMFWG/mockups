#!/bin/bash

#1)  post a new MemoryChunk to /Chassis/CXL/MemoryDomains/1/MemoryChunks/10 using file MD_1_MC_10_post.json
curl -X POST -H "Content-Type: application/json" \
        -d @../MD_1_MC_10_post.json \
        http://127.0.0.1:5000/redfish/v1/Chassis/PooledCXLType3/MemoryDomains/1/MemoryChunks

#2) post a new Connection 27 by sending a POST request to /Fabrics/CXL/Connections/27 with body of file C27_post.json
curl -X POST -H "Content-Type: application/json" \
        -d @../C27_post.json \
        http://127.0.0.1:5000/redfish/v1/Fabrics/CXL/Connections

#3) patch the Endpoint VT1.1 to update the Connection link by sending a PATCH request to /Fabrics/CXL/Endpoints/VT1.1 using VT1_1_patch.json
curl -X PATCH -H "Content-Type: application/json" \
        -d @../VT1_1_patch.json \
        http://127.0.0.1:5000/redfish/v1/Fabrics/CXL/Endpoints/VT1.1

#4) post a new Connection 28 by sending a POST request to /Fabrics/CXL/Connections/28 with body of file C28_post.json
curl -X POST -H "Content-Type: application/json" \
        -d @../C28_post.json \
        http://127.0.0.1:5000/redfish/v1/Fabrics/CXL/Connections

#5) patch the Endpoint VT1.2 to update the Connection link by sending a PATCH request to /Fabrics/CXL/Endpoints/VT1.2 using VT1_2_patch.json
curl -X PATCH -H "Content-Type: application/json" \
        -d @../VT1_2_patch.json \
        http://127.0.0.1:5000/redfish/v1/Fabrics/CXL/Endpoints/VT1.2