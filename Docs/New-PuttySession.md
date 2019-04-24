---
external help file: DHPutty-help.xml
Module Name: DHPutty
online version:
schema: 2.0.0
---

# New-PuttySession

## SYNOPSIS
Create a new putty session

## SYNTAX

```
New-PuttySession [-Name] <String> [-HostName] <String> [-Template] <String> [-Title <String>] [-WhatIf]
 [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Create a new putty session from an existing one. The name of the PuttySession is unique and a stored session consists of about 200
configuration properties and values that are stored in the user section of the registry (HKCU). The PuTTY application and DHPutty cmdlets use exactly the same sessions, which means you can choose to alter any saved session properties via the PuTTY Configuration GUI.

## EXAMPLES

### EXAMPLE 1
```
New-PuttySession -Name a1 -HostName ansible1 -Template WhiteOnOrange -Title 'Ansible 01 RHEL7'
```

### EXAMPLE 2
```
New-PuttySession -Name a2 -HostName ansible02 -Template WhiteOnOrange -Title 'Ansible 02 RHEL7'
```

## PARAMETERS

### -Name
Name of new Putty session to create

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -HostName
Host name or IP address of session

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Template
Name of existing session to act as template for new one

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Title
Optional Title to be put in WinTitle property of session

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -WhatIf
Shows what would happen if the cmdlet runs.
The cmdlet is not run.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: wi

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Confirm
Prompts you for confirmation before running the cmdlet.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: cf

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS

[Get-PuttySession]
[Rename-PuttySession]
[Remove-PuttySession]
[Set-PuttySession]
[Start-PuttySession]
