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

# vlsm_172.16.0.0_16 - 2

## Requerimiento

Se ha asignado la red `172.16.0.0/16` (Clase B) para diseñar un direccionamiento IP utilizando VLSM.

- IP LAN: `172.16.0.0/16`
- Red A: `280` dispositivos
- Red B: `240` dispositivos
- Red B: `50` dispositivos

## Análisis y solución

### Ordeno redes de mayor hosts a menor cantidad

### Cálculo Red A

```
subredes = 2^(bits_prestados)
hosts_por_subred = 2^(bits_host) - 2
bits_prestados = nueva_máscara - máscara_original
bits_host = 32 - nueva_máscara
bits_prestados = nueva_máscara - máscara_original
salto = 2^bits_host
```

```
IP LAN: 172.16.0.0/16 (280)
bits_host = 9
bits_host = 32 - nueva_máscara => nueva_mascara = 32 - 9 = 23
host_por_subred = 254
salto = 256
bits_prestados = 16 - 9 = 7
```


|red|IP LAN          | host min      | host max|  broadcast|
|:--|                  :--|           :--|      :--| :--|
|A|`172.16.0.0/23`| `172.16.0.1` | `172.16.1.254`| `172.16.1.255`|

### Cálculo Red B

IP LAN: `172.16.2.0`

```
subredes = 2^(bits_prestados)
hosts_por_subred = 2^(bits_host) - 2
bits_prestados = nueva_máscara - máscara_original
bits_host = 32 - nueva_máscara
bits_prestados = nueva_máscara - máscara_original
salto = 2^bits_host
```

```
--

```

|red|IP LAN          | host min      | host max|                broadcast|
|:--|                  :--|           :--|      :--| :--|
|B|``| `` | ``| ``|

### Cálculo Red B

```
subredes = 2^(bits_prestados)
hosts_por_subred = 2^(bits_host) - 2
bits_prestados = nueva_máscara - máscara_original
bits_host = 32 - nueva_máscara
bits_prestados = nueva_máscara - máscara_original
salto = 2^bits_host
```

```
--

```

|red|IP LAN          | host min      | host max|                broadcast|
|:--|                  :--|           :--|      :--| :--|
|B|``| `` | ``| ``|

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





