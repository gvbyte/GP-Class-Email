. "$PSScriptRoot\Classes\Email.ps1"
function Send-Email ($To, $From, $Subject, $Html, $Attachments, $Smtp) {[Email]::new().SendHTML($To, $From, $Subject, $Html, $Attachments, $Smtp);}