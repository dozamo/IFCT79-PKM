---
status: on
delivery: false
tags: ["IFCT79"]
type_note: question
parent:
topic: IFCT79
author: dzamo
description: ""
title: ""
---

# vlsm_192.168.1.0_16

## Requerimiento

Dada la siguiente topología y la dirección IP `192.168.1.0/16`, se nos pide que por medio de subnateo con VLSM obtengamos direccionamiento IP para los hosts de las siguientes dos subredes. Estan son:

- IP LAN: `192.168.1.0/16`
- Red RRHH: 8000 hosts
- Red Tecnico: 400 hosts

## Análisis y solución

### Ordeno redes de mayor hosts a menor cantidad

### Cálculo Red RRHH

```
subredes = 2^(bits_prestados)
hosts_por_subred = 2^(bits_host) - 2
bits_prestados = nueva_máscara - máscara_original
bits_host = 32 - nueva_máscara
bits_prestados = nueva_máscara - máscara_original
salto = 2^bits_host
```

# -------------------------------------------------#
# Reemplazando y calculando (segun datos que tenga)

```
hosts_por_subred = 2^(bits_host) - 2 = (2^13) - 2 = 8190 
salto = 2^bits_host = 2^13 = 8192
13 = 32 - nueva_máscara
=> nueva_máscara = 32 -13 = 19
8 8 3 

bits_prestados = nueva_máscara - máscara_original = 
=> 
```

|red|IP LAN          | host min      | host max|                broadcast|
|:--|                  :--|           :--|      :--| :--|
|estudiantes|`.../..`| `...` | `...`| `...`|

# Anexo / referencias

## Documentación consultada

- Documento PDF, profesor Rúben

## Formulas útiles y/o utilizadas

```
subredes = 2^(bits_prestados)
hosts_por_subred = 2^(bits_host) - 2
bits_prestados = nueva_máscara - máscara_original
bits_host = 32 - nueva_máscara
salto = 2^bits_host
```





