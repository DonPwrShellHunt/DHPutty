---
external help file: DHPutty-help.xml
online version: 
schema: 2.0.0
---

# Start-PuttySession

## SYNOPSIS
Launch putty loading specific Session

## SYNTAX

```
Start-PuttySession [-Name] <String[]>
```

## DESCRIPTION
Launch putty loading specific Session

## EXAMPLES

### -------------------------- EXAMPLE 1 --------------------------
```
Get-PuttySession -Name 'krb*' | Start-PuttySession
```

### -------------------------- EXAMPLE 2 --------------------------
```
Start-PuttySession -Name ApacheWeb01
```

## PARAMETERS

### -Name
Array of Session names to be started
Can accept from the pipeline

```yaml
Type: String[]
Parameter Sets: (All)
Aliases: 

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

## INPUTS

## OUTPUTS

## NOTES
Requires 'putty' to be in your path or
defined as an alias which points to putty

## RELATED LINKS

