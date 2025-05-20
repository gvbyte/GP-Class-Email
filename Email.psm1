. "$PSScriptRoot\Classes\Email.ps1"
function Send-Email ($To, $From, $Subject, [string]$Html, $Attachments, $Smtp) {[Email]::SendHTML($To, $From, $Subject, $Html, $Attachments, $Smtp);}
function Send-EmailHTML ($To, $From, $Subject, $Smtp) {[Email]::SendHTML($To, $From, $Subject, $(Get-Content -Path ".\var\html\PatchScheduleReport.html" -Raw), ".\var\html\PatchScheduleReport.html", $Smtp)}
function Send-EmailReport([string]$To, [string]$Report, [string]$Day) {[Email]::SendReport($To, $Report, $Day);}
function Send-EmailReportTeam([string]$Report, [string]$Day) {[Email]::SendReport("TEAM", $Report, $Day);}
function Send-EmailReportTest([string]$Report, [string]$Day) {[Email]::SendReport("TEST", $Report, $Day);}