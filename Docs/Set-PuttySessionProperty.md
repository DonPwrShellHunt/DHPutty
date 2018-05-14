---
external help file: DHPutty-help.xml
Module Name: DHPutty
online version:
schema: 2.0.0
---

# Set-PuttySessionProperty

## SYNOPSIS
Set specific properties in a Putty Session

## SYNTAX

```
Set-PuttySessionProperty [-Name] <String> [-PropertyHash] <Hashtable> [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Set specific properties in a Putty Session

## EXAMPLES

### EXAMPLE 1
```
Set-PuttySessionProperty -Name KerberosMagenta -PropertyHash @{WinTitle='Magenta';TermWidth=150;TermHeight=50}
```

## PARAMETERS

### -Name
The name of the Putty Session to change

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -PropertyHash
A hash table that contains Session property names and values
to set.
Dword properties should be numeric.

```yaml
Type: Hashtable
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
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
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
