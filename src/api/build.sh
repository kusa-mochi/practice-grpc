#!/bin/bash

protoc --go_out=dist/go --go_opt=paths=source_relative --go-grpc_out=dist/go --go-grpc_opt=paths=source_relative hello.proto
cd dist/go
go mod init hello.com/hello
