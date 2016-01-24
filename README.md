# Set-ADPicture

Set Active Directory user's account picture from PowerShell.

You can use this in a pipe with Get-ChildItem to set a bunch of pictures really easily.

i.e. Put the account pictures into a single directory and name them "\<samaccountname\>.jpg", then just run `Get-ChildItem C:\Pictures | Set-ADPicture`.
