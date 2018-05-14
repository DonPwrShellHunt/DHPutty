---
external help file: DHPutty-help.xml
Module Name: DHPutty
online version:
schema: 2.0.0
---

# Start-PuttySession

## SYNOPSIS
Launch putty loading specific Session

## SYNTAX

```
Start-PuttySession [-Name] <String[]> [<CommonParameters>]
```

## DESCRIPTION
Launch putty loading specific Session

## EXAMPLES

### EXAMPLE 1
```
Get-PuttySession -Name 'krb*' | Start-PuttySession
```

### EXAMPLE 2
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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES
Requires 'putty' to be in your path or
defined as an alias which points to putty

## RELATED LINKS
