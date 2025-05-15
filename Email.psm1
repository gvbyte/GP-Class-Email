. "$PSScriptRoot\Classes\Email.ps1"
function Send-Email ($To, $From, $Subject, [string]$Html, $Attachments, $Smtp) {[Email]::SendHTML($To, $From, $Subject, $Html, $Attachments, $Smtp);}
function Send-EmailPrompt () {[Email]::SendHTML($(Read-Host "To"), $(Read-Host "From"), $(Read-Host "Subject"), $(Read-Host "Html"), $(Read-Host "Attachments"), $(Read-Host "Smtp"));}
function Send-EmailHTML ($To, $From, $Subject, $Smtp) {[Email]::SendHTML($To, $From, $Subject, $(Get-Content -Path ".\var\html\PatchScheduleReport.html" -Raw), ".\var\html\PatchScheduleReport.html", $Smtp)}