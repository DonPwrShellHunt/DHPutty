function Get-PuttySession {
<#
    .SYNOPSIS
       Get Putty Session information 
    .DESCRIPTION
       Get Putty Session information
    .PARAMETER Name
       Wildcard string to find session by session name  
    .PARAMETER HostName
       Wildcard string to find session by HostName
    .PARAMETER WinTitle
       Wildcard string to find session by WinTitle
    .PARAMETER Property
       Property names of Putty session to return
       Defaults to 'HostName','WinTitle'
       Use 'All' to return all properties
    .EXAMPLE
       Get-PuttySession
    .EXAMPLE
       Get-PuttySession -Name 'k_*'
    .EXAMPLE
       Get-PuttySession -HostName '192.*'
    .EXAMPLE
       Get-PuttySession -WinTitle '*Apache*'
    .EXAMPLE
       Get-PuttySession -Name StdKerberos -Property All
    .NOTES
        Three parameter sets>
        ByName
        ByHost
        ByTitle
    
        Wildcard characters are supported in Name, HostName, and WinTitle
        parameters. Default behavior if no parameters are specified is
        to return all Putty sessions.
    
        ByHost and ByTitle will look in all defined Putty sessions for
        a match based on specific property. If no matches are found,
        then no sessions are returned.
    
        Return objects are [PSCustomObject} with properties:
        Name
        HostName
        WinTitle
        IsCentrify
        PropertySet

    
#>
    [CmdletBinding(DefaultParameterSetName='ByName')]
    [OutputType([PSCustomObject])]
    Param
    (
        # Name parameter gets Putty Sessions with names that match 
        [Parameter(Mandatory=$false,
                   ParameterSetName='ByName',
                   Position=0)]
        $Name='*',

        [Parameter(Mandatory=$true,
                   ParameterSetName='ByHost',
                   Position=0)]
        $HostName,
        
        [Parameter(Mandatory=$true,
                   ParameterSetName='ByTitle',
                   Position=0)]
        $WinTitle,
        
        [Parameter(Mandatory=$false)]
        [PSObject[]] $Property = ('HostName','WinTitle')
    )

    Begin {
        $SessionsDir = 'HKCU:\Software\SimonTatham\PuTTY\Sessions'
        If (!$Name) { 
            # if we are searching on property match, look at all sessions
            $Name = '*' 
        }
        $matchedSessions = @(Get-Item -Path "$SessionsDir\*" -Include $Name)

        if ($HostName) {
            $matchPropName = 'HostName'
            $matchPropValue = $HostName 
        }
        if ($WinTitle) {
            $matchPropName = 'WinTitle'
            $matchPropValue = $WinTitle
        }

        if ($matchedSessions.Count -ne 0) {
            foreach ($ms in $matchedSessions) {
                if ($matchPropName) {
                    if ($ms.GetValue($matchPropName) -notlike $matchPropValue) { 
                        continue 
                    }
                }
                # Determines IsCentrify based on existence of DoKerberos property
                if ($Property[0] -eq 'All') {
                    $pset = Get-PuttySessionPropertySet -Name $ms.PSChildName
                } else {
                    $pset = Get-PuttySessionPropertySet -Name $ms.PSChildName -Property $Property
                }
                $objhash = [ordered] @{
                    Name=$ms.PSChildName
                    HostName=$ms.GetValue('HostName')
                    WinTitle=$ms.GetValue('WinTitle')
                    IsCentrify=($ms.Property -contains 'DoKerberos')
                    PropertySet=$pset
                }
                $obj = New-Object -TypeName PSObject -Property $objhash
                $obj.PSObject.TypeNames.Insert(0,'DonHunt.Putty.Session')
                Write-Output -InputObject $obj
            }
        } else {
            Write-Verbose -Message ('No sessions matched with Name {0}' -f $Name)
        }
    }
    
    Process {

    }

    End {

    }
}

function Remove-PuttySession {
<#
    .SYNOPSIS
       Removes a named Putty Session
    .DESCRIPTION
       Removes a named Putty Session
    .PARAMETER Name
       Wildcard string to specify which session to remove
    .EXAMPLE
       Remove-PuttySession -Name CentMagenta
    .EXAMPLE
       Get-PuttySession -Name 'z_*' | Remove-PuttySession
    .EXAMPLE
       Remove-PuttySession -Name 'kHost1','kHost2' -WhatIf
#>
    [CmdletBinding(SupportsShouldProcess=$true)]
    Param
    (
        # Name of session to remove
        [Parameter(Mandatory=$true,
                   ValueFromPipelineByPropertyName=$true,
                   Position=0)]
        [String[]]$Name
    )

    Begin {
        $SessionsDir = 'HKCU:\Software\SimonTatham\PuTTY\Sessions'
    }

    Process {
        foreach ($n in $Name) {
            $matchedSessions = @(Get-Item -Path "$SessionsDir\*" -Include $n)
            foreach ($ms in $matchedSessions) {
                $msg = 'Session: {0}' -f $ms.PSChildName
                if ($PSCmdlet.ShouldProcess($msg)) {
                    Remove-Item -Path $ms.PSPath
                    Write-Verbose -Message "Removed Putty $msg"
                }
            }
        }
    }

    End {

    }
}

function Rename-PuttySession {
<#
    .SYNOPSIS
       Rename a Putty Session
    .DESCRIPTION
       Rename a Putty Session
    .PARAMETER Name
       Name of Putty session to rename
       Must match exactly, including case
    .PARAMETER NewName
       New Name of Putty session
       Validates NewName is composed of letters, numbers,
       and underscore characters only.
    .EXAMPLE
       Rename-PuttySession -Name CentMagenta -NewName TemplateMagenta   
#>
    [CmdletBinding(SupportsShouldProcess=$true)]
    Param
    (
        [Parameter(Mandatory=$true,
                   Position=0)]
        [String]$Name,

        [Parameter(Mandatory=$true,
                   Position=1)] 
        [ValidatePattern('^[\w]*$')]
        [String]$NewName
    )

    Begin {
        $SessionsDir = 'HKCU:\Software\SimonTatham\PuTTY\Sessions'

        $sessionNames = (Get-ChildItem -Path $SessionsDir).PSChildName
        # Do not clobber existing session on rename operation
        if ($sessionNames -contains $NewName) {
            Write-Warning -Message ('Session: {0} already exists.' -f $NewName)
            Return
        }

        $matchedSessions = @(Get-Item -Path "$SessionsDir\*" -Include $Name)
        if ($matchedSessions.Count -ne 1) {
            Write-Error -Message ('{0} does not uniquely identify session!' -f $Name)
        } else {
            $msg = ('{0} --> {1}' -f $Name,$NewName)
            if ($PSCmdlet.ShouldProcess($msg)) {
                Rename-Item -Path $matchedSessions[0].PSPath -NewName $NewName
            }
        }
    }

    Process {
    
    }

    End {
    
    }
}

function New-PuttySession {
    [CmdletBinding(SupportsShouldProcess=$true)]
    Param
    (
        # Name of new putty session
        [Parameter(Mandatory=$true,
                   Position=0)]
        [String]$Name,

        # HostName that putty session will connect to
        [Parameter(Mandatory=$true,
                   Position=1)]
        [String]$HostName,

        # Template session name used as basis for new one
        [Parameter(Mandatory=$true,
                   Position=2)]
        [String]$Template,

        # Title is WindowTitle content in session
        [Parameter(Mandatory=$false)]
        [String]$WinTitle=''
    )

    Begin {
        $SessionsDir = 'HKCU:\Software\SimonTatham\PuTTY\Sessions'

        $sessionNames = (Get-ChildItem -Path $SessionsDir).PSChildName

        if ($sessionNames -contains $Name) {
            Write-Warning -Message ('Session: {0} already exists.' -f $Name)
            Return
        }

        if ($sessionNames -notcontains $Template) {
            Write-Warning -Message ('Template: {0} does not exist.' -f $Template)
            Return
        }

        $srcSession = Get-Item -Path "$SessionsDir\$Template"
        $newSessionPath = "$SessionsDir\$Name"

        Write-Verbose -Message $srcSession.PSPath
        Write-Verbose -Message $newSessionPath

        if ($PSCmdlet.ShouldProcess($Name)) {
            Copy-Item -LiteralPath $srcSession.PSPath -Destination $newSessionPath
            Set-ItemProperty -Path $newSessionPath -Name HostName -Value $HostName
            Set-ItemProperty -Path $newSessionPath -Name WinTitle -Value $WinTitle
        }
    }

    End {
    
    }
}

function Start-PuttySession {
<#
    .SYNOPSIS
        Launch putty loading specific Session 
    .DESCRIPTION
        Launch putty loading specific Session 
    .PARAMETER Name
        Array of Session names to be started
        Can accept from the pipeline
    .EXAMPLE
        Get-PuttySession -Name 'krb*' | Start-PuttySession
    .EXAMPLE
        Start-PuttySession -Name ApacheWeb01
    .NOTES
        Requires 'putty' to be in your path or
        defined as an alias which points to putty
#>
    [CmdletBinding()]
    Param
    (
        # Param1 help description
        [Parameter(Mandatory=$true,
                   ValueFromPipelineByPropertyName=$true,
                   Position=0)]
        [String[]]$Name
    )

    Begin {
        # if putty command is available, we can just use it
        # if not available, an error will be thrown
        $puttycmd = Get-Command -Name putty -ErrorAction Stop
        Write-Verbose -Message ('{0}' -f $puttycmd)
    }
    
    Process {
        foreach ($n in $Name) {
            putty -load $n
        }
    }
    
    End {
    
    }
}


function Get-PuttySessionPropertySet {
    <#
        .SYNOPSIS
            Get properties associated with a Putty session
        .DESCRIPTION
            Get properties associated with a Putty session.
            All properties or a subset of properties can be returned.
        .PARAMETER Name
            Session Name that properties should belong to
        .PARAMETER Property
            Array of property names whose properties will be returned
        .OUTPUTS
            PSCustomObject with properties of
            PropertyName, PropertyType, PropertyValue
        .EXAMPLE
            Get-PuttySessionPropertySet -Name krbExample
        .EXAMPLE
            Get-PuttySession -Name *mgt01 | Get-PuttySessionPropertySet
        .EXAMPLE
            Get-PuttySessionPropertySet -Name krbExample -Property 'TermWidth','TermHeight'
    
            PropertyName PropertyType PropertyValue
            ------------ ------------ -------------
            TermWidth           Dword            80
            TermHeight          Dword            24
        .NOTES
            Requires Registry module
            Returns PSCustomObject collection
    #>
        [CmdletBinding(DefaultParameterSetName='All')]
        param
        (
            [Parameter(Mandatory=$true,ValueFromPipelineByPropertyName=$true)]
            [System.String]
            $Name,
            [Parameter(Mandatory=$true,ParameterSetName='Subset')]
            [System.String[]]
            $Property
        )
    
        Begin {
            Write-Verbose -Message ('In Begin Block, Processing ParameterSetName: {0}' -f $PSCmdlet.ParameterSetName)
            $nofilter = $PSCmdlet.ParameterSetName -eq 'All'
            $puttypath = 'HKCU:\Software\SimonTatham\PuTTY\Sessions'
    
        }
    
        Process {
            Write-Verbose -Message ('In Process Block, ParameterSetName: {0}' -f $PSCmdlet.ParameterSetName)
    
            # get the Sessions that are defined in the HKCU hive
            $slist = (Get-Item -Path $puttypath).GetSubKeyNames()
            if ($slist -contains $Name) {
                $subkeypath = Join-Path -Path $puttypath -ChildPath $Name
                # Following gets all property names and types associated with session
                $pi = Get-Item -Path $subkeypath
                
                # loop through all properties via parallel names,types getting property values
                foreach ($propname in $pi.GetValueNames() ) {
                    $propType = $pi.GetValueKind($propname)
                    $pv = $pi.GetValue($propname)
                    
                    if ($nofilter -or ($Property -contains $propName)) {
                        
                        $objhash = @{
                            PropertyName = $propName
                            PropertyType = $propType
                            PropertyValue = $pv
                        }
                        $obj = New-Object -TypeName PSObject -Property $objhash
                        $obj.PSObject.TypeNames.Insert(0,'DonHunt.Putty.Session.PropertySetItem')
                        Write-Output -InputObject $obj
                    }
                    
                }
                
            } else {
                Write-Warning -Message ('{0} is an invalid session name' -f $Name)
            }
        }
    
        End {
            Write-Verbose -Message ('In End Block, ParameterSetName: {0}' -f $PSCmdlet.ParameterSetName)
    
        }
}

function Set-PuttySessionProperty {
<#
    .SYNOPSIS
        Set specific properties in a Putty Session 
    .DESCRIPTION
        Set specific properties in a Putty Session 
    .PARAMETER Name
        The name of the Putty Session to change 
    .PARAMETER PropertyHash
        A hash table that contains Session property names and values
        to set. Dword properties should be numeric.
    .EXAMPLE
        Set-PuttySessionProperty -Name KerberosMagenta -PropertyHash @{WinTitle='Magenta';TermWidth=150;TermHeight=50}
#>
    [CmdletBinding(SupportsShouldProcess=$true)]
    Param
    (
        # Name is the Putty Session to be updated
        [Parameter(Mandatory=$true,
                   ValueFromPipelineByPropertyName=$true,
                   Position=0)]
        [String]
        $Name,

        # PropertyHash contains the names & values of the properties to be set
        [Parameter(Mandatory=$true,
                   Position=1)]
        [hashtable]
        $PropertyHash
    )

    Begin {
        $puttypath = 'HKCU:\Software\SimonTatham\PuTTY\Sessions'
        $subkeypath = Join-Path -Path $puttypath -ChildPath $Name

        $allprops = @(Get-PuttySessionPropertySet -Name $Name)
        if ($allprops.Count -gt 1) {
            # create hash where property name is key, type is value (String, Dword)
            $pntype = @{}
            foreach ($p in $allprops) {
                $pntype[$p.PropertyName] = $p.PropertyType
            }
        } else {
            Write-Error -Message ('Invalid Session Name: {0}' -f $Name)
            throw 'Bad session name'
        }
    }

    Process {
        foreach ($k in $PropertyHash.keys) {
            
            switch ($pntype[$k])
            {
                'String'  {
                    [String]$value = $PropertyHash[$k]
                    if ($PSCmdlet.ShouldProcess($k)) {
                        $rv = Set-ItemProperty -Path $subkeypath -Name $k -Value $value -Verbose
                    }
                }
                
                'Dword'   {
                    if ($PSCmdlet.ShouldProcess($k)) {
                        $rv = Set-ItemProperty -Path $subkeypath -Name $k -Value $PropertyHash[$k] -Verbose
                    }
                }
                
                default   { 
                    Write-Warning -Message ('For PropertyName: {0} Unhandled Type: {1}' -f $k,$pntype[$k])
                }
            }
        }
        
    }

    End {
    
    }
}
