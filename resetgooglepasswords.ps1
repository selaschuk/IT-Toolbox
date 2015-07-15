Get-ADUser -Filter * -Properties userPrincipalName,mail | Where-Object {(($_.distinguishedName -like "*Staff*,OU=Schools,DC=DOMAIN,DC=local") -or ($_.distinguishedName -like "*Division Office*,DC=DOMAIN,DC=local"))} | ForEach-Object {
	$pass = Get-Random
	$user = $_.sAMAccountName
	$mail = $_.mail
	$google = $_.userPrincipalName
	$command = "C:\gam\gam.exe update user $user password $pass changepassword on"
	Invoke-Expression -Command $command
	Send-MailMessage -Body "Your temporary Google Apps password for the new DOMAIN.com google domain is`r`n`r`n$pass`r`n`r`nPlease login to https://myaccount.google.com/ as $google and you will be prompted to change it." -To $mail -From "helpdesk@DOMAIN.com" -Subject "DOMAIN.com Google Password" -SmtpServer "mail.DOMAIN.com"
}
