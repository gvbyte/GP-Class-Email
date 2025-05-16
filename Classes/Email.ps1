class Email {
    static [void] SendHTML($to, $from, $subject, $html, $Attachments, $smtp){
        try {
            Send-MailMessage -To $to -From $from -Attachments $Attachments -Subject $subject -Body $html -BodyAsHtml -SmtpServer $smtp -ErrorAction Stop;
            Write-Host -ForegroundColor Green "Email Sent to: $($To) | From: $($from)"
            Trace-Success -module "Email"-message "Email sent";
        }
        catch {
           Write-Warning "[!} Failed to send email:`n$($Error)";
           Read-Host "Press ENTER to continue"
        }
    }
    static [void] Test($Subject){
        Trace-Info -module "Email"-message "Test Email executed";
        $Config = (Get-Content .\config.json -Raw | ConvertFrom-Json);
        [Email]::SendHTML(($Config.Email), "DoNotReply@$($Config.Domain)", $Subject, $(Get-Content -Path ".\var\html\PatchScheduleReport.html" -Raw), ".\var\html\PatchScheduleReport.html", ($Config.SMTP))    
        
    }
    static [void] SendToTeam($Subject) {
        $Config = (Get-Content .\config.json -Raw | ConvertFrom-Json);
        [Email]::SendHTML("$($Config.Distro)@$($Config.Domain)", "DoNotReply@$($Config.Domain)", $Subject, $(Get-Content -Path ".\var\html\PatchScheduleReport.html" -Raw), ".\var\html\PatchScheduleReport.html", ($Config.SMTP))
    }
    static [void] HTML(){}
    static [void] Attachments(){}
}