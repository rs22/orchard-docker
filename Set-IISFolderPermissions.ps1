$acl = Get-Acl c:\inetpub\wwwroot
$accessRule = New-Object System.Security.AccessControl.FileSystemAccessRule(
    "IIS_IUSRS", 
    "Write", 
    [system.security.accesscontrol.InheritanceFlags]"ContainerInherit, ObjectInherit", 
    [system.security.accesscontrol.PropagationFlags]"None", 
    "Allow"
)
$acl.AddAccessRule($accessRule)
Get-Item c:\inetpub\wwwroot\App_Data | Set-Acl -aclobject  $acl
Get-Item c:\inetpub\wwwroot\Media    | Set-Acl -aclobject  $acl
Get-Item c:\inetpub\wwwroot\Themes   | Set-Acl -aclobject  $acl
Get-Item c:\inetpub\wwwroot\Modules  | Set-Acl -aclobject  $acl
