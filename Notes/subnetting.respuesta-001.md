---
status: on/delivery-pending
tags: ["IFCT79"]
---
# Packet Tracer: Situación de división en subredes 2

## Topología

***[Situación inicial]***

![Caso de estudio 2 - topología](../Attachments/subnetting.ejercicio.png)


***[Respuesta topología de esta versión 1]***

En este documento se detalla como se ha cálculado esta primera topología representada a continuación. Esta es:

![Representación respuesta 001][subnetting-respuesta-001]

[subnetting-respuesta-001]:../Attachments/subnetting.respuesta-001.png

## Tabla de direccionamiento

| Dispositivo | Interfaz | Dirección IP | Máscara de subred | Gateway predeterminado |
|-------------|----------|--------------|-------------------|------------------------|
| R1          | G0/0     |  `172.31.1.3`            | `27`       | No aplicable           |
| R1          | S0/0/0   |   `172.31.1.225`          | `27`       | No aplicable           |
| R2          | G0/0     | `172.31.1.34`             | `27`       | No aplicable           |
| R2          | S0/0/0   |   `172.31.1.226`          | `27`       | No aplicable           |
| R2          | S0/0/1   | `172.31.1.193`            | `27`       | No aplicable           |
| R3          | G0/0     |   `172.31.1.66`           | `27`       | No aplicable           |
| R3          | S0/0/0   | `172.31.1.161`            | `27`       | No aplicable           |
| R3          | S0/0/1   |  `172.31.1.194`           | `27`       | No aplicable           |
| R4          | G0/0     | `172.31.1.97`             | `27`       | No aplicable           |
| R4          | S0/0/0   | `172.31.1.162`            | `27`       | No aplicable           |
| S1          | VLAN 1   | `172.31.1.30`              | `27`       |   `172.31.1.3`                    |
| S2          | VLAN 1   |   `172.31.1.62`            | `27`       |        `172.31.1.34`             |
| S3          | VLAN 1   |  `172.31.1.94`             | `27`       |    `172.31.1.66`                 |
| S4          | VLAN 1   |   `172.31.1.126`           | `27`       |    `172.31.1.97`                 |
| PC1         | NIC      |  `172.31.1.11`             | `27`       |     `172.31.1.3`                  |
| PC2         | NIC      |   `172.31.1.38`           | `27`       |    `172.31.1.34`                 |
| PC3         | NIC      |   `172.31.1.68`           | `27`       |     `172.31.1.66`                |
| PC4         | NIC      |  `172.31.1.98`            | `27`       |     `172.31.1.97`                |

## Objetivos

- ***Parte 1: Diseñar un esquema de direccionamiento IP***
- ***Parte 2: Asignar direcciones IP a los dispositivos de red y verificar la conectividad***
  
## Situación

En esta actividad, se le asigna la dirección de red `172.31.1.0/24` para que la divida en subredes y proporcione direccionamiento IP para la red que se muestra en la topología. Las direcciones de host requeridas para cada enlace WAN y LAN se muestran en la topología.

# Parte 1: Diseñar un esquema de direccionamiento IP

**Paso 1: Divida la red `172.31.1.0/24` en subredes de acuerdo con la cantidad máxima de hosts que requiere la subred más extensa.**

- a. Según la topología, ¿cuántas subredes se necesitan? **7**

# Resolución versión 1

## Especificación inicial

- IP LAN: `172.31.1.0/24`.
- Cantidad de subredes iniciales (necesarias): `7`.
- Cantidad de host por cada subred (LAN) (es la que mas ip host necesita): `14`.

## Resolviendo (ver formulas en *Anexo/referencias*)

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
|5 | `172.1.1.128/27`| `172.31.1.129`| `172.31.1.158` | `172.31.1.159` | `30` |
|6 | `172.31.1.160/27`| `172.31.1.161`| `172.31.1.190` | `172.31.1.191` | `30` |
|7 | `172.31.1.192/27`| `172.31.1.193`| `172.31.1.222` | `172.31.1.223` | `30` |
|8 | `172.31.1.224/27`| `172.31.1.225`| `172.31.1.254` | `172.31.1.255` | `30` |

La representación de la topología resultante se muestra en [Representación respuesta 001][subnetting-respuesta-001] en este mismo documento.

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
