Compress-Archive -Path '.\output\*.*' -CompressionLevel Optimal -DestinationPath '.\package.zip' -Update
$Content = Get-Content -Path package.zip  -Encoding Byte
$Base64 = [System.Convert]::ToBase64String($Content)
$Base64 | Out-File package_encoded.txt
