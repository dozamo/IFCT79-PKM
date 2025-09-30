---
status: on/delivery-pending
tags: ["IFCT79"]
parent:
type_note: question
topic: IFCT79
parent:
---

# Packet Tracer: Situación de división en subredes 2

## Topología

![Caso de estudio 2 - topología](../Attachments/subnetting.ejercicio.png)

## Tabla de direccionamiento

| Dispositivo | Interfaz | Dirección IP | Máscara de subred | Gateway predeterminado |
|-------------|----------|--------------|-------------------|------------------------|
| R1          | G0/0     |              |        | No aplicable           |
| R1          | S0/0/0   |            |        | No aplicable           |
| R2          | G0/0     |              |        | No aplicable           |
| R2          | S0/0/0   |           |        | No aplicable           |
| R2          | S0/0/1   |             |        | No aplicable           |
| R3          | G0/0     |            |       | No aplicable           |
| R3          | S0/0/0   |             |        | No aplicable           |
| R3          | S0/0/1   |             |        | No aplicable           |
| R4          | G0/0     |              |        | No aplicable           |
| R4          | S0/0/0   |             |        | No aplicable           |
| S1          | VLAN 1   |               |       |                      |
| S2          | VLAN 1   |             |        |                |
| S3          | VLAN 1   |              |        |                   |
| S4          | VLAN 1   |            |        |                     |
| PC1         | NIC      |              |        |                    |
| PC2         | NIC      |            |        |                     |
| PC3         | NIC      |            |        |                   |
| PC4         | NIC      |             |       |                     |

## Objetivos

- ***Parte 1: Diseñar un esquema de direccionamiento IP***
- ***Parte 2: Asignar direcciones IP a los dispositivos de red y verificar la conectividad***
  
## Situación

En esta actividad, se le asigna la dirección de red `172.31.1.0/24` para que la divida en subredes y proporcione direccionamiento IP para la red que se muestra en la topología. Las direcciones de host requeridas para cada enlace WAN y LAN se muestran en la topología.

# Parte 1: Diseñar un esquema de direccionamiento IP

**Paso 1: Divida la red `172.31.1.0/24` en subredes de acuerdo con la cantidad máxima de hosts que requiere la subred más extensa.**

- a. Según la topología, ¿cuántas subredes se necesitan? **______**

