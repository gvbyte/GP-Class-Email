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

    static [void] SendReport([string]$To, [string]$Report, [string]$Day) {
        $Email = '';
        $Config = (Get-Content '.\etc\Config\config.json' -Raw | ConvertFrom-Json);
        switch ($To) {
            'TEST' {$Email = $Config.Email}
            'TEAM' {$Email = $Config.Distro}
            Default {$Email = $Config.Email}
        }
        [Email]::SendHTML("$($Email)", "DoNotReply@$($Config.Domain)", "[Daily] $($Report) Report - $($Day)", $(Get-Content -Path ".\var\html\PatchScheduleReport.html" -Raw), ".\var\html\PatchScheduleReport.html", ($Config.SMTP))
    }

    static [void] HTML(){}

    static [void] SelectAttachments(){
        
    }
}