$currentDirectory = (Convert-Path .)
$scriptRoot = $PSScriptRoot

$dist = "$scriptRoot/dist"
if(Test-Path $dist) {
    Remove-Item $dist -Recurse -Force
    sleep 3
}
New-Item $dist -ItemType Directory
New-Item "$dist/go" -ItemType Directory
New-Item "$dist/connect-web" -ItemType Directory
protoc --go_out=dist/go --go_opt=paths=source_relative --go-grpc_out=dist/go --go-grpc_opt=paths=source_relative hello.proto
cd "$dist/go"
go mod init hello.com/hello
cd $scriptRoot
# curl --output _buf.exe https://github.com/bufbuild/buf/releases/download/v1.12.0/buf-Windows-x86_64.exe
# cp _buf.exe buf.exe
# rm _buf.exe
npm i
npm run build-connect-web

cd $currentDirectory