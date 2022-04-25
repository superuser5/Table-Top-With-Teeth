# Open Template, Insert Test Payloads
# Save as new File. Don't Overwrite Template
$HTAoutputFile = 'Thunderstruck.hta'
$XSLoutputFile = 'Thunderstruck.xsl'

#Replace base64 string in payload.js
$jsEncodedPayload = Get-Content -Path "..\builder\payloads\originals\payload.b64" -Raw;
$jsRaw =  Get-Content -Path "payload.js" -Raw;
$jsreplace = @{
e8ab42cdaa944c7992cd6b98db34848a = $jsEncodedPayload 
}
$jsfinal = $jsRaw | foreach { [regex]::Replace( $_,'(e8ab42cdaa944c7992cd6b98db34848a)',{$jsreplace[$args[0].value]} ) } 


#HTA Processing
$source = Get-Content -Path "HTA_Template.hta" -Raw;
$legitHeader = @'
<script>
'@

$legitFooter = @'
</script>
'@
$legit = $legitHeader + $jsfinal + $legitFooter 
$replace = @{
fd543bbe07624bb681c0be62fec0825b = $legit 
}
$final = $source | foreach { [regex]::Replace( $_,'(fd543bbe07624bb681c0be62fec0825b)',{$replace[$args[0].value]} ) } 
$final | Out-File $HTAoutputFile -Encoding Ascii



#XSL Processing 
$xslsource = Get-Content -Path "XSL_Template.xsl" -Raw;
$xslegit = $jsfinal
$xslreplace = @{
f41aa6971584494db47c6b3c5dd60010 = $xslegit 
}
$xslfinal = $xslsource | foreach { [regex]::Replace( $_,'(f41aa6971584494db47c6b3c5dd60010)',{$xslreplace[$args[0].value]} ) } 
$xslfinal | Out-File $XSLoutputFile -Encoding Ascii
