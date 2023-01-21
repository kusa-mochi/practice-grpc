$currentDirectory = (Convert-Path .)
$scriptRoot = $PSScriptRoot

cd $scriptRoot
if(Test-Path go.mod) {
    rm go.mod
}
if(Test-Path go.sum) {
    rm go.sum
}
go mod init hello.com/client
go mod edit -replace hello.com/hello=../../api/dist/go
go mod tidy

cd $currentDirectory
