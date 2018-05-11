---
external help file: DHPutty-help.xml
online version: 
schema: 2.0.0
---

# Get-PuttySession

## SYNOPSIS
Get Putty Session information

## SYNTAX

### ByName (Default)
```
Get-PuttySession [[-Name] <Object>] [-Property <PSObject[]>]
```

### ByHost
```
Get-PuttySession [-HostName] <Object> [-Property <PSObject[]>]
```

### ByTitle
```
Get-PuttySession [-Title] <Object> [-Property <PSObject[]>]
```

## DESCRIPTION
Get Putty Session information as an object with properties

## EXAMPLES

### -------------------------- EXAMPLE 1 --------------------------
```
Get-PuttySession
```

### -------------------------- EXAMPLE 2 --------------------------
```
Get-PuttySession -Name 'k_*'
```

### -------------------------- EXAMPLE 3 --------------------------
```
Get-PuttySession -HostName '192.*'
```

### -------------------------- EXAMPLE 4 --------------------------
```
Get-PuttySession -Title '*Apache*'
```

### -------------------------- EXAMPLE 5 --------------------------
```
Get-PuttySession -Name StdKerberos -Property All
```

## PARAMETERS

### -Name
Wildcard string to find session by session name

```yaml
Type: Object
Parameter Sets: ByName
Aliases: 

Required: False
Position: 1
Default value: *
Accept pipeline input: False
Accept wildcard characters: False
```

### -HostName
Wildcard string to find session by HostName

```yaml
Type: Object
Parameter Sets: ByHost
Aliases: 

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Title
Wildcard string to find session by WinTitle

```yaml
Type: Object
Parameter Sets: ByTitle
Aliases: 

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Property
Property names of Putty session to return
Defaults to 'HostName','WinTitle'
Use 'All' to return all properties

```yaml
Type: PSObject[]
Parameter Sets: (All)
Aliases: 

Required: False
Position: Named
Default value: ('HostName','WinTitle')
Accept pipeline input: False
Accept wildcard characters: False
```

## INPUTS

## OUTPUTS

### System.Management.Automation.PSObject

## NOTES
Three parameter sets\>
ByName
ByHost
ByTitle

Wildcard characters are supported in Name, HostName, and Title
parameters.
Default behavior if no parameters are specified is
to return all Putty sessions.

ByHost and ByTitle will look in all defined Putty sessions for
a match based on specific property.
If no matches are found,
then no sessions are returned.

Return objects are \[PSCustomObject} with properties:
Name
HostName
Title
IsCentrify
PropertySet

## RELATED LINKS

