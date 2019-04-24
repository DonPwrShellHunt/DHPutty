# DHPutty

## about_DHPutty

# SHORT DESCRIPTION

DHPutty helps manage PuTTY Sessions

# LONG DESCRIPTION

DHPutty supports PuTTYSession operations of get, new, rename, remove, and start.

PuttySessionPropertySet object operations include get & set.

## PuTTY VERSIONS
In addition to the standard PuTTY versions, this module can also handle Centrify PuTTY. Centrify adds an extra set of properties relating to Kerboros connectivity.

# EXAMPLES
PS> Get-PuttySession -Hostname "*apache*" | Start-PuttySession
PS> Get-PuttySession -Name WhiteOnOrange -Property All | Export-CliXML -Path WhiteOnOrange.clixml

# NOTE
Either an executable or PowerShell alias by the name of putty must be available in order for the Start-PuttySession
cmdlet to function properly. To confirm this, run the command>
```
Get-Command putty
```

# TROUBLESHOOTING NOTE
The DHPutty module uses registry cmdlets that are generated using CDXML.

# SEE ALSO
Various other PuTTY modules are in the PowerShellGallery which may be of interest.

# KEYWORDS
