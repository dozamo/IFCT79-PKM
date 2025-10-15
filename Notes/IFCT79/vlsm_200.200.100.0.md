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

# vlsm_200.200.100.0_24

## Requerimiento

Dada la siguiente topología y la dirección IP `200.200.100.0/24`, se nos pide que por medio de subnateo con VLSM obtengamos direccionamiento IP para los hosts de las 3 subredes. Estan son:

- IP LAN: 
- Red estudiantes: 100 hosts
- Red profesores: 30 hosts
- Red invitados: 24 hosts 
- Red inter router: 2 hosts
- 4 router (conexiones punto a punto serial entre ellos)

## Análisis y solución

### Ordeno redes de mayor hosts a menor cantidad

### Cálculo Red estudiantes

- `hosts_por_subred = 2^(bits_host) - 2 = (2^7) - 2 = 126`
-  bits_host = `7` (bits de porcion de host)
- bits_prestados = `1` (ya que `8 - 7`)
- nueva_máscara = `bits_prestados + máscara_original = 1 + 24`
- salto = `2^bits_host` = `2^7 = 128`

|red|IP LAN          | host min      | host max|                broadcast|
|:--|                  :--|           :--|      :--| :--|
|estudiantes|`200.200.100.0/25`| `200.200.100.1` | `200.200.100.126`| `200.200.100.127`|

### Cálculo Red profesores

- `hosts_por_subred = 2^(bits_host) - 2 = (2^5) - 2 = 30`
- bits_host = `5` (bits de porcion de host)
- bits_prestados = `3` (ya que `8 - 5`)
- nueva_máscara = `bits_prestados + máscara_original = 3 + 24`
- salto = `2^bits_host` = `2^5 = 32`

|red|IP LAN          | host min      | host max|                broadcast|
|:--|                  :--|           :--|      :--| :--|
|profesores|`200.200.100.128/27`| `200.200.129` | `200.200.158`| `200.200.100.159`|

### Cálculo Red invitados

- `hosts_por_subred = 2^(bits_host) - 2 = (2^5) - 2 = 30`
- bits_host = `5` (bits de porcion de host)
- bits_prestados = `3` (ya que `8 - 5`)
- nueva_máscara = `bits_prestados + máscara_original = 3 + 24`
- salto = `2^bits_host` = `2^ = 32`

|red|IP LAN          | host min      | host max|                broadcast|
|:--|                  :--|           :--|      :--| :--|
|invitados|`200.200.100.160/27`| `200.200.100.161` | `200.200.100.190`| `200.200.100.191`|

### Cálculo Redes inter router

- `hosts_por_subred = 2^(bits_host) - 2 = (2^2) - 2 = 2`
- bits_host = `2` (bits de porcion de host)
- bits_prestados = `6` (ya que `8 - 2`)
- nueva_máscara = `bits_prestados + máscara_original = 30 + 24 `
- salto = `2^bits_host` = `2^ = 4`

|red|IP LAN          | host min      | host max|                broadcast|
|:--|                  :--|           :--|      :--| :--|
|r2-r1|`200.200.100.192/30`| `200.200.100.193` | `200.200.100.194`| `200.200.100.195`|
|r3-r1|`200.200.100.196/30`| `200.200.100.197` | `200.200.100.198`| `200.200.100.199`|
|r4-r1|`200.200.100.200/30`| `200.200.100.201` | `200.200.100.202`| `200.200.100.203`|

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





