$Content = Get-Content -Path XSL_PostEx.xsl -Encoding Byte
$Base64 = [System.Convert]::ToBase64String($Content)
$Base64 | Out-File encoded2.txt