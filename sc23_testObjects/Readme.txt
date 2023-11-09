#   to de-allocate SLD associated with Endpoint T4 from host CXL_System3:
#	we have to remove T4 from the Connection 13 which ties target endpoint T4 and MemoryChunk 1 of MemoryDomain 4 to Initiator endpoint I3
#	we need to 
#		1) patch Connection 13 by sending a PATCH request to /Fabrics/CXL/Connections/13 with body of file C13_patch.json
#
#		in real life someone would have to patch the Endpoint T4 json to remove the link to Connections/13 connection, but we will cheat
#		and wait until we tie the T4 Endpoint to I2 Endpoint with Connection 14, THEN we just patch Endpoint T4 once with the final link to the new connection
#
#	next we need to
#		2) post a new Connection 14 by sending a POST request to /Fabrics/CXL/Connections/14 with body of file C14_post.json
#	next we do one patch to the target endpoint T4
#		3) patch the Endpoint T4 to update the Connection link by sending a PATCH request to /Fabrics/CXL/Endpoints/T4 with body of file T4_patch.json
#
#
#
####
#
#	to create a new chunk in the MLD:
#
#		1)  post a new MemoryChunk to /Chassis/CXL/MemoryDomains/1/MemoryChunks/10 using file MD_4_MC_10_post.json
#				this will post the new MLD memory chunk #10, and link it to the two MLD LogicalDevices 1 and 2, 
#				and to the related VT1.1 and VT1.2 virtual endpoints
#
#	to bind the new MLD chunk to existing hosts:
#
#		2) post a new Connection 27 by sending a POST request to /Fabrics/CXL/Connections/27 with body of file C27_post.json
#				this will post a new Connection that ties Initiator 1 to the VT1.1 virtual endpoint and the new Memory Chunk
#				NOTE:  this connection only gives I1 (host 1) permission to access the new shared memory chunk!
#
#		next we do one patch to the target endpoint VT1.1
#		3) patch the Endpoint VT1.1 to update the Connection link by sending a PATCH request to /Fabrics/CXL/Endpoints/VT1.1 using VT1_1_patch.json
#
#
#		at a later time (after Host 1 finishes initializing data) we can enable Host 2 to access the new memory chunk
#
#		4) post a new Connection 28 by sending a POST request to /Fabrics/CXL/Connections/28 with body of file C28_post.json
#				this will post a new Connection that ties Initiator 2 to the VT1.2 virtual endpoint and the new Memory Chunk
#				NOTE:  this connection only gives I2 (host 2) permission to access the new shared memory chunk!
#		4) patch the Endpoint VT1.2 to update the Connection link by sending a PATCH request to /Fabrics/CXL/Endpoints/VT1.2 using VT1_2_patch.json
#

#				NOTE:  We could have taken Host 1's access away hours ago
#
