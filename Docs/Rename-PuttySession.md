---
external help file: DHPutty-help.xml
online version: 
schema: 2.0.0
---

# Rename-PuttySession

## SYNOPSIS
Rename a Putty Session

## SYNTAX

```
Rename-PuttySession [-Name] <String> [-NewName] <String> [-WhatIf] [-Confirm]
```

## DESCRIPTION
Rename a Putty Session

## EXAMPLES

### -------------------------- EXAMPLE 1 --------------------------
```
Rename-PuttySession -Name CentMagenta -NewName TemplateMagenta
```

## PARAMETERS

### -Name
Name of Putty session to rename
Must match exactly, including case

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

### -NewName
New Name of Putty session
Validates NewName is composed of letters, numbers,
and underscore characters only.

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

