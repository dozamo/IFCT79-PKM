---
status: on
delivery: false
tags: ["IFCT79"]
parent:
type_note: answer
topic: IFCT79
author: dzamo
description: "Packet Tracer: Situación división en subredes 2 - multisegmentación/mejorando la asignación de IP inter router"
---

# Packet Tracer: Situación de división en subredes 2

## Topología

***[Respuesta topología versión 2 resuelta en este documento]***

En este documento se detalla como se ha cálculado esta segunda topología representada a continuación. 

> En esta propuesta se ha intentando hacer un uso más óptimo de los IP en los que puede *subnatearse* la LAN `172.31.1.0/24` especificada inicialmente. Esto principalmente para las redes que se definen conexiones punto a punto de los router (R1, R2, R3 y R4). A continuación se detalla el cálculo de la topología resultante representada [en este diagrama][subnetting-respuesta-002].

![Representación respuesta 002][subnetting-respuesta-002]

[subnetting-respuesta-002]:../attachments/subnetting.respuesta-002.png

### Tabla de direccionamiento resultante

| Dispositivo | Interfaz | Dirección IP | Máscara de subred | Gateway predeterminado |
|-------------|----------|--------------|-------------------|------------------------|
| R1          | G0/0     |  `172.31.1.3`            | `27`       | No aplicable           |
| R1          | S0/0/0   |   `172.31.1.9`          | `30`       | No aplicable           |
| R2          | G0/0     | `172.31.1.34`             | `27`       | No aplicable           |
| R2          | S0/0/0   |   `172.31.1.10`          | `30`       | No aplicable           |
| R2          | S0/0/1   | `172.31.1.5`            | `30`       | No aplicable           |
| R3          | G0/0     |   `172.31.1.66`           | `27`       | No aplicable           |
| R3          | S0/0/0   | `172.31.1.6`            | `30`       | No aplicable           |
| R3          | S0/0/1   |  `172.31.1.1`           | `30`       | No aplicable           |
| R4          | G0/0     | `172.31.1.97`             | `27`       | No aplicable           |
| R4          | S0/0/0   | `172.31.1.2`            | `30`       | No aplicable           |
| S1          | VLAN 1   | `172.31.1.30`              | `27`       |   `172.31.1.3`                    |
| S2          | VLAN 1   |   `172.31.1.62`            | `27`       |        `172.31.1.34`             |
| S3          | VLAN 1   |  `172.31.1.94`             | `27`       |    `172.31.1.66`                 |
| S4          | VLAN 1   |   `172.31.1.126`           | `27`       |    `172.31.1.97`                 |
| PC1         | NIC      |  `172.31.1.11`             | `27`       |     `172.31.1.3`                  |
| PC2         | NIC      |   `172.31.1.38`           | `27`       |    `172.31.1.34`                 |
| PC3         | NIC      |   `172.31.1.68`           | `27`       |     `172.31.1.66`                |
| PC4         | NIC      |  `172.31.1.98`            | `27`       |     `172.31.1.97`                |

## Objetivos

- Parte 1: Diseñar un esquema de direccionamiento IP
- Parte 2: Asignar direcciones IP a los dispositivos de red y verificar la conectividad 
  
## Situación

En esta actividad, se le asigna la dirección de red `172.31.1.0/24` para que la divida en subredes y proporcione direccionamiento IP para la red que se muestra en la topología. Las direcciones de host requeridas para cada enlace WAN y LAN se muestran en la topología.

### Parte 1: Diseñar un esquema de direccionamiento IP

Paso 1: Divida la red `172.31.1.0/24` en subredes de acuerdo con la cantidad máxima de hosts que requiere la subred más extensa.

- a. Según la topología, ¿cuántas subredes se necesitan? ***7***

# Resolución versión 1

## Especificación inicial

- IP LAN: `172.31.1.0/24`.
- Cantidad de subredes iniciales (necesarias): `7`.
- Cantidad de host por cada subred (LAN) (es la que mas ip host necesita): `14`.

## Resolviendo subredes 1, 2, 3 y 4 (ver formulas en *Anexo/referencias*)

`bits_prestados = 3` (ya que subredes = 2^3 = 8 con lo que cubrimos las 7 subredes que necesitamos)
`host_por_subred = 2^(5) - 2 = 30` (También cubrimos mas de los 14 host necesarios, para la red de S3)
`3 = nueva_máscara - 24` => `nueva_máscara = 24 + 3 = 27`  
`bits_host = 32 - 27 = 5`
`salto = 2^5 = 32`

|SUB LAN | IP LAN (dirección de red) | Host min | Host max | Broadcast | Host disponibles |
|:--            |:--                        |:--       |:--       |:--        |:-- |      
|1 | `172.31.1.0/27` | `172.31.1.1` | `172.31.1.30` | `172.31.1.31` | `30` |
|2 | `172.31.1.32/27`| `172.31.1.33`| `172.31.1.62` | `172.31.1.63` | `30` |
|3 | `172.31.1.64/27`| `172.31.1.65`| `172.31.1.94` | `172.31.1.95` | `30` |
|4 | `172.31.1.96/27`| `172.31.1.97`| `172.31.1.126` | `172.31.1.127` | `30` |
|~~5~~ | ~~`172.1.1.128/27`~~| ~~`172.31.1.129`~~| ~~`172.31.1.158`~~ | ~~`172.31.1.159`~~ | ~~`30`~~ |
|~~6~~ | ~~`172.31.1.160/27`~~| ~~`172.31.1.161`~~| ~~`172.31.1.190`~~ | ~~`172.31.1.191`~~ | ~~`30`~~ |
|~~7~~ | ~~`172.31.1.192/27`~~| ~~`172.31.1.193`~~| ~~`172.31.1.222`~~ | ~~`172.31.1.223`~~ | ~~`30`~~ |
|~~8~~ | ~~`172.31.1.224/27`~~| ~~`172.31.1.225`~~| ~~`172.31.1.254`~~ | ~~`172.31.1.255`~~ | ~~`30`~~ |

En esta segunda solución se siguen utilizando para las subredes 1, 2, 3 y 4 tal como fueron cálculadas en la primera versión, la tabla anterior muestra la definición de las asignaciones de IP.

## Resolviendo subredes inter router (o punto a punto)


Inicialmente tenemos tal que: `172.31.1.0/24`, según el Anexo de este mismo documentos tenemos que:

- `hosts_por_subred = 2^(bits_host) - 2` => con solo `2` bits de host tendremos `(2^2) - 2 = 2` host (o IP disponibles de usar), con lo que en esta topología ahora con solo `3` subredes de solo `2` host (o IP) disponibles para cada una de ellas ya podemos cubrir todas las conexiones punto a punto, o inter router que se requieren.

De modo que con solo aplicar las formulas, esto es:

- `subredes = 2^(bits_prestados) = 2^6 = 64` (subredes posibles. A continuación y en este trabajo solo calculamos las `4` primeras, de las que utilizaremos `3`)
- `hosts_por_subred = 2^(bits_host) - 2 = (2^2) - 2 = 2`
- `bits_prestados = nueva_máscara - máscara_original` => `6 = nueva_máscara - 24` => `máscara_nueva = 30`
- `bits_host = 32 - nueva_máscara = 2`
- `salto = 2^2 = 4`

Con esto tenemos todos los datos para las 4 primeras subredes que se resumen en la siguiente tabla. Esta es:

|SUB LAN | IP LAN (dirección de red) | Host min | Host max | Broadcast | Host disponibles |
|:--            |:--                        |:--       |:--       |:--        |:-- |      
|1 |`172.31.1.0/30`| `172.31.1.1`| `172.31.1.2`| `172.31.1.3`|`2`|
|2 |`172.31.1.4/30`| `172.31.1.5`| `172.31.1.6`| `172.31.1.7`|`2`|
|3 |`172.31.1.8/30`| `172.31.1.9`| `172.31.1.10`| `172.31.1.11`|`2`|
|~~4~~ |~~`172.31.1.12/30`~~| ~~`172.31.1.13`~~| ~~`172.31.1.14`~~| ~~`172.31.1.15`~~|~~`2`~~|
|~~...~~ |~~...~~|~~...~~|~~...~~|~~...~~|~~`2`~~|

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


