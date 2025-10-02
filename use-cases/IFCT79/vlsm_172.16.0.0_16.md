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

# vlsm_172.16.0.0_16

## Requerimiento

Se ha asignado la red `172.16.0.0/16` (Clase B) para diseñar un direccionamiento IP utilizando VLSM.

- IP LAN: `172.16.0.0/16`
- Red A: `300` dispositivos
- Red B: `100` dispositivos
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
*subredes = 2^(bits_prestados)
bits_host = 8
hosts_por_subred = 2^(8) - 2 = 254

bits_prestados = nueva_máscara - máscara_original
8 = nueva_mascara - 16 => nueva_máscara = 24

salto = 2^8 =256

bits_host = 32 - nueva_máscara
bits_prestados = nueva_máscara - máscara_original
salto = 2^bits_host
```


|red|IP LAN          | host min      | host max|                broadcast|
|:--|                  :--|           :--|      :--| :--|
|A|`172.16.0.0/24`| `172.16.0.1` | `172.16.0.254`| `172.16.0.255`|

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
IP LAN = 172.16.1.0/25
bits_host = 32 - nueva_máscara = 7 = 32 - nueva_máscara 
  => nueva_máscara = 32 - 7 = 25
salto = 2^bits_host = 128
```

|red|IP LAN          | host min      | host max|                broadcast|
|:--|                  :--|           :--|      :--| :--|
|B|`172.16.1.0/25`| `172.16.1.1` | `172.16.1.126`| `172.16.1.127`|

---

### Cálculo Red C

```
subredes = 2^(bits_prestados)
hosts_por_subred = 2^(bits_host) - 2
bits_prestados = nueva_máscara - máscara_original
bits_host = 32 - nueva_máscara
bits_prestados = nueva_máscara - máscara_original
salto = 2^bits_host
```

```
IP LAN = 172.16.1.128/26
bits_host = 6
bits_host = 32 - nueva_máscara = 6 = 32 - nueva_máscara 
  => nueva_máscara = 32 - 6 = 26
salto = 2^bits_host = 64
```

|red|IP LAN          | host min      | host max|                broadcast|
|:--|                  :--|           :--|      :--| :--|
|C|`172.16.1.128/26`| `172.16.1.129` | `172.16.1.190`| `172.16.1.191`|

### Tabla con todas

|red|IP LAN          | host min      | host max|                broadcast|
|:--|                  :--|           :--|      :--| :--|
|A|`172.16.0.0/24`| `172.16.0.1` | `172.16.0.254`| `172.16.0.255`|
|B|`172.16.1.0/25`| `172.16.1.1` | `172.16.1.126`| `172.16.1.127`|
|C|`172.16.1.128/26`| `172.16.1.129` | `172.16.1.190`| `172.16.1.191`|

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





