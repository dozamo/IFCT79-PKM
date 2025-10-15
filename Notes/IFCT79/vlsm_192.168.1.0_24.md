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

# vlsm_192.168.1.0_24

## Requerimiento

Dada la siguiente topología y la dirección IP `192.168.1.0/24`, se nos pide que por medio de subnateo con VLSM obtengamos direccionamiento IP para los hosts de las 3 subredes. Estan son:

- IP LAN: 192.168.1.0/24
- Red 3: 50 hosts
- Red 1: 20 hosts
- Red 2: 100 hosts 

## Análisis y solución

### Ordeno redes de mayor hosts a menor cantidad

- Red 2: 100 hosts 
- Red 3: 50 hosts
- Red 1: 20 hosts

### Cálculo Red 2

`hosts_por_subred = 2^(bits_host) - 2 = (2^7) - 2 = 126`

bits_host = `7` (bits de porcion de host)
bits_prestados = `1` (ya que `8 - 7`)
nueva_máscara = `bits_prestados + máscara_original = 25`
salto = `2^bits_host` = `2^7 = 128`

|IP LAN          | host min      | host max|                broadcast|
|`192.168.1.0/25`| `192.168.1.1` | `192.168.1.126`| `255.255.255.127`|

### Cálculo Red 3

cnt hosts = 50

`hosts_por_subred = 2^(bits_host) - 2 = (2^6) - 2 = 62`

bits_host = `6` (bits de porcion de host)
bits_prestados = `2` (ya que `..`)
nueva_máscara = `bits_prestados + máscara_original = 2 + 24 = ..`
salto = `2^bits_host` = ``

|IP LAN          | host min      | host max|                broadcast|
|``| `` | ``| ``|


### Solución

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





