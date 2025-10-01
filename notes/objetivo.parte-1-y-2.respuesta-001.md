---
title: "Packet Tracer: Situación de división en subredes 1"
status: on
delivery: false
tags: ["IFCT79"]
type_note: question
parent:
topic: IFCT79
author: dzamo
description: ""
---

# Packet Tracer: Situación de división en subredes 1

## Topología

![Topología versión 1][objetivo-respuesta-001]

[objetivo-respuesta-001]: ../images/objetivo.respuesta-001.png

## Objetivos

- **Parte 1: Diseñar un esquema de direccionamiento IP**
 
- **Parte 2: Asignar direcciones IP a los dispositivos de red y verificar la conectividad** 
 
## Situación 
 
En esta actividad, se le asigna la dirección de red `192.168.100.0/24` para que cree una subred y proporcione el direccionamiento IP para la red que se muestra en la topología. Cada LAN de la red necesita espacio suficiente para alojar, como mínimo, 25 direcciones para dispositivos 
finales, el switch y el router. La conexión entre las redes R1 y R2 requiere una dirección IP para cada extremo del enlace. 

## Análisis/Resolución (Justificación y cálculos de la solución)

Apoyandonos en las formulas del *Anexo / Referencias* podemos resolver el escenario y la documentación del curso, podemos resolver. La respuesta se detalla a continuación.

### ¿Cúantas subredes necesitamos?

Según la representación de la topología, en principio se requieren ***5 subredes***.

> Podemos probar cuantos `bits_prestados` necesitaremos (y/o revisar en documento pdf de clase), esto es:
> 
> - `bits_prestados = 1` ➡️ `subredes = 2^(1) = 2` ❌
> - `bits_prestados = 2` ➡️ `subredes = 2^(2) = 4` ❌
> - `bits_prestados = 3` ➡️ `subredes = 2^(3) = 8` ✅

En principio con `3 bits_prestados` del **bloque host** al **bloque de red** ya podemos definir las `5` subredes que necesitaremos.

### Cálculo inicial de los host por subred

```
IP 32 bits:  NNNN NNNN . NNNN NNNN . NNNN NNNN . HHHH HHHH
            |                                  ||         | 
Bloques:    |--------  Porción de Red  --------||-- Host -|
```

*Donde:*

- `N`: Es bit del bloque o porción del red
- `H`: Es bit del blique o porción del host

> ⚠️ Recordar que en subnetting y/o direccionamiento CIDR, el ***bloque que siempre presta*** es el de ***host***.

Considerando el item anterior, en este escenario, tenemos:

- Bits prestados: `3`

La representación anterior es tal que:

```
IP 32 bits:  NNNN NNNN . NNNN NNNN . NNNN NNNN . SSS H HHHH
            |                                  | ⬇️ |       \
Bloques:    |--------  Porción de Red  --------| ⬇️ |- Host-|
                                                 ⬇️
                                              Subredes
```

*Donde (ahora):*

- `S`: Son bits prestados para asignar las subredes.

***Entonces hasta aquí tenemos:***

```
Bits prestados = 3
Bits para host = 5
```
---

***Cálculemos:***

```
hosts_por_subred = (2^bits_host) - 2 = (2^5) - 2 = 30
```

- Sabemos que:

```
bits_prestados = nueva_máscara - máscara_original
```

Despejando `nueva_máscara` en la anterior formula tenemos:

```
nueva_máscara = 24 + 3 = 27 
```

---

**Aunque ya lo cáculamos antes, podemos nuevamente con `bits_host` cálcular el `salto`, que es:**

```
salto = 2^bits_host = 32
```

⚠️ En el Anexo se referencia material consultado

## Resolución Parte 1

### Las cuatro primeras LAN inter host/switch/router (gateway de esa subred)

|SUB LAN | IP LAN (dirección de red) | Host min | Host max | Broadcast | Host disponibles |
|:--            |:--                        |:--       |:--       |:--        |:-- |      
|1 | `192.168.100.0/27` | `192.168.100.1` | `192.168.100.30` | `192.168.100.31` | `30` |
|2 | `192.168.100.32/27` | `192.168.100.33` | `192.168.100.62` | `192.168.100.63` | `30` |
|3 | `192.168.100.64/27` | `192.168.100.65` | `192.168.100.94` | `192.168.100.95` | `30` |
|4 | `192.168.100.96/27` | `192.168.100.97` | `192.168.100.126` | `192.168.100.127` | `30` |
|N | `.../27` | `` | `` | `` | `30` |

*Donde*:

- `N`: es el número de subred (en la tabla solo se muestran los rangos que se utilizan para la resolución de este escenario).

### La red inter router (conexión punto a punto y serial)

En este item se cálcula la red para ser utilizada en la conexión inter router.

En esta conexión punto a punto solo se necesitan 2 (dos) IP pues es el total de *host* (activos) a conectar.

- De `hosts_por_subred = 2^(bits_host) - 2` deducimos que con solo `2` bits de host ya podemos asignar ***dos IP para host's** pues `hosts_por_subred = (2^2) - 2 = 2`
- Los demas bits del *bloque host* son *prestados* al *bloque de red* para las subredes a crear (aunque solo utilizaremos una de estas subredes), con lo que: 
  
  ```
  subredes = 2^(bits_prestados) = 2^(8-2) = 64
  ```
  **Nota:** Solo utilizaremos una de estas, pues solo tenemos un punto a punto requerido.

- Y ahora los otros cálculos
   - De `bits_prestados = nueva_máscara - máscara_original` que es `6 = nueva_máscara - 24` podemos despejar `nueva_máscara = 24 + 6 = 30`
   - De `salto = 2^bits_host` calculamos `salto = 2^2 = 4`

***Tabla de definición IP** (solo se cálculan dos, y se utilizará una de ellas)

|SUB LAN | IP LAN (dirección de red) | Host min | Host max | Broadcast | Host disponibles |
|:--            |:--                        |:--       |:--       |:--        |:-- |      
|1 | `192.168.100.0/30` | `192.168.100.1` | `192.168.100.2` | `192.168.100.3` | `2` |
|2 | `192.168.100.4/30` | `192.168.100.5` | `192.168.100.6` | `192.168.100.7` | `2` |
|N | `.../30` | `` | `` | `` | `2` |


Con el anterior análisis quedan sugerido el diseño del esquema de direccionamiento IP de las cinco subredes para implementar el escenario. El diagrama es mostrado en [topología versión 1][objetivo-respuesta-001].

### Asignación de IP

## Tabla de direccionamiento

| Dispositivo | Interfaz | Dirección IP | Máscara de subred | Gateway predeterminado |
|-------------|----------|--------------|-------------------|------------------------|
| R1          | G0/0     | `192.168.100.30` | `27`          | No aplicable           |
| R1          | G0/1     | `192.168.100.62` | `27`          | No aplicable           |
| R1          | S0/0/0   | `192.168.100.5`  | `30`          | No aplicable           |
| R2          | G0/0     | `192.168.100.94` | `27`          | No aplicable           |
| R2          | G0/1     | `192.168.100.126` | `27`         | No aplicable           |
| R2          | S0/0/0   | `192.168.100.6`   | `30`         | No aplicable           |
| S1          |          | `192.168.100.29`  | `27`         |                        |
| S2          |          | `192.168.100.61`  | `27`         |                        |
| S3          |          | `192.168.100.93`  | `27`         |                        |
| S4          |          | `192.168.100.125` | `27`         |                        |
| PC1         | NIC      | `192.168.100.5`   | `27`         |                        |
| PC2         | NIC      | `192.168.100.37`  | `27`         |                     |
| PC3         | NIC      | `192.168.100.69`  | `27`         |                   |
| PC4         | NIC      | `192.168.100.101` | `27`         |                     |

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