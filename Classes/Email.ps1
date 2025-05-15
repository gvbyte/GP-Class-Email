class Email {
    static [void] SendHTML($to, $from, $subject, $html, $Attachments, $smtp){
        try {
            Send-MailMessage -To $to -From $from -Attachments $Attachments -Subject $subject -Body $html -BodyAsHtml -SmtpServer $smtp -ErrorAction Stop;
            Write-Host -ForegroundColor Green "Email Sent to: $($To) | From: $($from)"
        }
        catch {
           Write-Warning "[!} Failed to send email:`n$($Error)";
           Read-Host "Press ENTER to continue"
        }
    }
}