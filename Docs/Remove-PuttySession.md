---
external help file: DHPutty-help.xml
online version: 
schema: 2.0.0
---

# Remove-PuttySession

## SYNOPSIS
Removes a named Putty Session

## SYNTAX

```
Remove-PuttySession [-Name] <String[]> [-WhatIf] [-Confirm]
```

## DESCRIPTION
Removes a named Putty Session

## EXAMPLES

### -------------------------- EXAMPLE 1 --------------------------
```
Remove-PuttySession -Name CentMagenta
```

### -------------------------- EXAMPLE 2 --------------------------
```
Get-PuttySession -Name 'z_*' | Remove-PuttySession
```

### -------------------------- EXAMPLE 3 --------------------------
```
Remove-PuttySession -Name 'kHost1','kHost2' -WhatIf
```

## PARAMETERS

### -Name
Wildcard string to specify which session to remove

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

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS

