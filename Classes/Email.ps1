class Email {
    static [void] SendHTML($to, $from, $subject, $html, $smtp){
        try {
            Send-MailMessage -To $to -From $from -Attachments $html -Subject $subject -Body $(Get-Content $html -Raw) -BodyAsHtml -SmtpServer $smtp;
            Write-Host -ForegroundColor Green "[!} Email Sent to: $($To) | From: $($from)"
        }
        catch {
           Write-Warning "[!} Failed to send email:`n $($Error)";
           Read-Host "[*] Press ENTER to continue"
        }
    }
}