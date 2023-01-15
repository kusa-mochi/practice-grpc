#!/bin/bash

protoc --go_out=../pkg/grpc --go_opt=paths=source_relative --go-grpc_out=../pkg/grpc --go-grpc_opt=paths=source_relative hello.proto
cd ../pkg/grpc
go mod init hello.com/hello
