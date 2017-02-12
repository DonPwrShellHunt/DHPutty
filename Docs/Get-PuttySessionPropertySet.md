---
external help file: DHPutty-help.xml
online version: 
schema: 2.0.0
---

# Get-PuttySessionPropertySet

## SYNOPSIS
Get properties associated with a Putty session

## SYNTAX

### All (Default)
```
Get-PuttySessionPropertySet -Name <String>
```

### Subset
```
Get-PuttySessionPropertySet -Name <String> -Property <String[]>
```

## DESCRIPTION
Get properties associated with a Putty session.
All properties or a subset of properties can be returned.

## EXAMPLES

### -------------------------- EXAMPLE 1 --------------------------
```
Get-PuttySessionPropertySet -Name krbExample
```

### -------------------------- EXAMPLE 2 --------------------------
```
Get-PuttySession -Name *mgt01 | Get-PuttySessionPropertySet
```

### -------------------------- EXAMPLE 3 --------------------------
```
Get-PuttySessionPropertySet -Name krbExample -Property 'TermWidth','TermHeight'
```

PropertyName PropertyType PropertyValue
------------ ------------ -------------
TermWidth           Dword            80
TermHeight          Dword            24

## PARAMETERS

### -Name
Session Name that properties should belong to

```yaml
Type: String
Parameter Sets: (All)
Aliases: 

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Property
Array of property names whose properties will be returned

```yaml
Type: String[]
Parameter Sets: Subset
Aliases: 

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

## INPUTS

## OUTPUTS

### PSCustomObject with properties of
PropertyName, PropertyType, PropertyValue

## NOTES
Requires Registry module
Returns PSCustomObject collection

## RELATED LINKS

