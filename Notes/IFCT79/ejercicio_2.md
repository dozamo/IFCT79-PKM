---
status: on
delivery: false
tags: ["IFCT79"]
type_note: question
parent:
topic: IFCT79
author: dzamo
description: "Implementación de alta disponibilidad en backbone de routers mediante OSPF"
title: "Alta Disponibilidad con OSPF: Topología Full-Mesh e IPv4 Estática"
---

# Ejercicio 2: Configuración de Alta Disponibilidad con OSPF

## Enunciado

Implementar una configuración de red de alta disponibilidad sobre la topología proporcionada, cumpliendo con los siguientes requisitos:

- **Direccionamiento IP estático/fijo** en todos los dispositivos de red (principalmente routers)
- **Protocolo de enrutamiento dinámico** distinto a RIP
- **Alta disponibilidad** que garantice el servicio de enrutamiento ante fallas de enlaces del backbone

## Topología de Red

![Topología Ejercicio 2][ejercicio_2]

[ejercicio_2]: ../images/ejercicio_2.png

La topología implementada corresponde a una red **full-mesh** con 4 routers interconectados mediante 6 enlaces WAN punto a punto, proporcionando redundancia completa.

---

## Solución Propuesta

### Justificación Técnica

Para cumplir con los requisitos establecidos, se implementó la siguiente solución:

- **Direccionamiento IPv4 estático:** Asignación manual de direcciones IP en todas las interfaces de routers y PCs
- **Protocolo OSPF (Open Shortest Path First):** Protocolo de enrutamiento dinámico de estado de enlace que reemplaza a RIP
- **Topología full-mesh:** Cada router se conecta directamente con los otros tres routers, garantizando múltiples rutas alternativas

#### ¿Por qué OSPF?

OSPF es un protocolo de enrutamiento interior que permite:

- Convergencia rápida ante cambios en la topología
- Soporte para diseño jerárquico mediante áreas
- Cálculo de rutas óptimas basado en costos configurables
- Escalabilidad superior a protocolos de vector distancia como RIP

#### Sobre el Uso de Packet Tracer

Debido a limitaciones en la interfaz gráfica de Packet Tracer para configuraciones OSPF avanzadas, se utilizó **CLI (Command Line Interface) de Cisco IOS** para la configuración completa. Este documento incluye tanto capturas de pantalla como transcripciones de comandos ejecutados.

---

## Configuración Implementada

### 1. Asignación de Direccionamiento IPv4

#### 1.1 Configuración de PCs

| Dispositivo | Dirección IP | Máscara de Subred | Gateway Predeterminado |
|-------------|--------------|-------------------|------------------------|
| PC0 | 192.168.1.10 | 255.255.255.0 | 192.168.1.1 |
| PC1 | 192.168.4.10 | 255.255.255.0 | 192.168.4.1 |
| PC2 | 192.168.3.10 | 255.255.255.0 | 192.168.3.1 |
| PC3 | 192.168.2.10 | 255.255.255.0 | 192.168.2.1 |

##### Capturas de Configuración

| PC0 - `ipconfig` | PC1 - `ipconfig` |
|:----------------:|:----------------:|
| ![ipconfig pc0](ejercicio_2-pc0.png) | ![ipconfig pc1](ejercicio_2-pc1.png) |

| PC2 - `ipconfig` | PC3 - `ipconfig` |
|:----------------:|:----------------:|
| ![ipconfig pc2](ejercicio_2-pc2.png) | ![ipconfig pc3](ejercicio_2-pc3.png) |

#### 1.2 Configuración de Routers

##### Tabla de Direccionamiento WAN

| Enlace | Router A | IP Router A | Router B | IP Router B | Subred |
|--------|----------|-------------|----------|-------------|--------|
| Enlace 1 | Router1 | 192.168.5.1/30 | Router4 | 192.168.5.2/30 | 192.168.5.0/30 |
| Enlace 2 | Router1 | 192.168.6.1/30 | Router2 | 192.168.6.2/30 | 192.168.6.0/30 |
| Enlace 3 | Router1 | 192.168.9.1/30 | Router3 | 192.168.9.2/30 | 192.168.9.0/30 |
| Enlace 4 | Router2 | 192.168.7.1/30 | Router3 | 192.168.7.2/30 | 192.168.7.0/30 |
| Enlace 5 | Router2 | 192.168.10.1/30 | Router4 | 192.168.10.2/30 | 192.168.10.0/30 |
| Enlace 6 | Router3 | 192.168.8.1/30 | Router4 | 192.168.8.2/30 | 192.168.8.0/30 |

##### Router1 - Configuración de Interfaces

```c
Router1>enable
Router1#show running-config | section interface
interface GigabitEthernet0/0
 ip address 192.168.1.1 255.255.255.0
 duplex auto
 speed auto
interface GigabitEthernet0/1
 no ip address
 duplex auto
 speed auto
 shutdown
interface Serial0/0/0
 ip address 192.168.5.1 255.255.255.252
interface Serial0/0/1
 ip address 192.168.6.1 255.255.255.252
interface Serial0/1/0
 ip address 192.168.9.1 255.255.255.252
interface Serial0/1/1
 no ip address
 clock rate 2000000
interface Vlan1
 no ip address
 shutdown
```

##### Router2 - Configuración de Interfaces

```c
Router2>enable
Router2#show running-config | section interface
interface GigabitEthernet0/0
 ip address 192.168.4.1 255.255.255.0
 duplex auto
 speed auto
interface GigabitEthernet0/1
 no ip address
 duplex auto
 speed auto
 shutdown
interface Serial0/0/0
 ip address 192.168.6.2 255.255.255.252
 clock rate 2000000
interface Serial0/0/1
 ip address 192.168.7.1 255.255.255.252
interface Serial0/1/0
 ip address 192.168.10.1 255.255.255.252
interface Serial0/1/1
 no ip address
 clock rate 2000000
interface Vlan1
 no ip address
 shutdown
```

##### Router3 - Configuración de Interfaces

```c
Router3>enable
Router3#show running-config | section interface
interface GigabitEthernet0/0
 ip address 192.168.3.1 255.255.255.0
 duplex auto
 speed auto
interface GigabitEthernet0/1
 no ip address
 duplex auto
 speed auto
 shutdown
interface Serial0/0/0
 ip address 192.168.7.2 255.255.255.252
 clock rate 2000000
interface Serial0/0/1
 ip address 192.168.8.1 255.255.255.252
interface Serial0/1/0
 ip address 192.168.9.2 255.255.255.252
 clock rate 2000000
interface Serial0/1/1
 no ip address
 clock rate 2000000
 shutdown
interface Vlan1
 no ip address
 shutdown
```

##### Router4 - Configuración de Interfaces

```c
Router4>enable
Router4#show running-config | section interface
interface GigabitEthernet0/0
 ip address 192.168.2.1 255.255.255.0
 duplex auto
 speed auto
interface GigabitEthernet0/1
 no ip address
 duplex auto
 speed auto
 shutdown
interface Serial0/0/0
 ip address 192.168.5.2 255.255.255.252
 clock rate 2000000
interface Serial0/0/1
 ip address 192.168.8.2 255.255.255.252
 clock rate 2000000
interface Serial0/1/0
 ip address 192.168.10.2 255.255.255.252
 clock rate 2000000
interface Serial0/1/1
 no ip address
 clock rate 2000000
 shutdown
interface Vlan1
 no ip address
 shutdown
```

### 2. Configuración OSPF Multi-Área

#### 2.1 Diseño de Áreas OSPF

La red se dividió en 5 áreas OSPF para optimizar el enrutamiento:

- Área 0 (Backbone): Enlaces WAN punto a punto entre routers
- Área 1: Red LAN de Router1 (192.168.1.0/24)
- Área 2: Red LAN de Router2 (192.168.4.0/24)
- Área 3: Red LAN de Router3 (192.168.3.0/24)
- Área 4: Red LAN de Router4 (192.168.2.0/24)

#### 2.2 Parámetros de Optimización

Para mejorar la convergencia y detección de fallas, se configuraron:

- Router-IDs únicos: 1.1.1.1, 2.2.2.2, 3.3.3.3, 4.4.4.4
- OSPF Cost: 100 en todas las interfaces seriales (balanceo de carga)
- Hello Interval: 5 segundos (reducido desde 10 seg por defecto)
- Dead Interval: 20 segundos (reducido desde 40 seg por defecto)

_Nota:_ El comando timers throttle spf no está disponible en Packet Tracer y fue omitido de la configuración.

#### 2.3 Comandos de Configuración por Router

##### Router1 - Configuración OSPF

```c
Router1>enable
Router1#configure terminal

! Limpiar configuración OSPF previa
Router1(config)#no router ospf 1

! Configuración OSPF optimizada
Router1(config)#router ospf 1
Router1(config-router)#router-id 1.1.1.1

! Red LAN en Área 1
Router1(config-router)#network 192.168.1.0 0.0.0.255 area 1

! Enlaces WAN en Área 0 (backbone)
Router1(config-router)#network 192.168.5.0 0.0.0.3 area 0
Router1(config-router)#network 192.168.6.0 0.0.0.3 area 0
Router1(config-router)#network 192.168.9.0 0.0.0.3 area 0
Router1(config-router)#exit

! Optimización de interfaces seriales
Router1(config)#interface serial0/0/0
Router1(config-if)#ip ospf cost 100
Router1(config-if)#ip ospf hello-interval 5
Router1(config-if)#ip ospf dead-interval 20
Router1(config-if)#exit

Router1(config)#interface serial0/0/1
Router1(config-if)#ip ospf cost 100
Router1(config-if)#ip ospf hello-interval 5
Router1(config-if)#ip ospf dead-interval 20
Router1(config-if)#exit

Router1(config)#interface serial0/1/0
Router1(config-if)#ip ospf cost 100
Router1(config-if)#ip ospf hello-interval 5
Router1(config-if)#ip ospf dead-interval 20
Router1(config-if)#exit

! Guardar configuración
Router1(config)#exit
Router1#write memory
```

##### Router2 - Configuración OSPF

```c
Router2>enable
Router2#configure terminal
Router2(config)#no router ospf 1

Router2(config)#router ospf 1
Router2(config-router)#router-id 2.2.2.2
Router2(config-router)#network 192.168.4.0 0.0.0.255 area 2
Router2(config-router)#network 192.168.6.0 0.0.0.3 area 0
Router2(config-router)#network 192.168.7.0 0.0.0.3 area 0
Router2(config-router)#network 192.168.10.0 0.0.0.3 area 0
Router2(config-router)#exit

Router2(config)#interface serial0/0/0
Router2(config-if)#ip ospf cost 100
Router2(config-if)#ip ospf hello-interval 5
Router2(config-if)#ip ospf dead-interval 20
Router2(config-if)#exit

Router2(config)#interface serial0/0/1
Router2(config-if)#ip ospf cost 100
Router2(config-if)#ip ospf hello-interval 5
Router2(config-if)#ip ospf dead-interval 20
Router2(config-if)#exit

Router2(config)#interface serial0/1/0
Router2(config-if)#ip ospf cost 100
Router2(config-if)#ip ospf hello-interval 5
Router2(config-if)#ip ospf dead-interval 20
Router2(config-if)#exit

Router2(config)#exit
Router2#write memory
```

##### Router3 - Configuración OSPF

```c
Router3>enable
Router3#configure terminal
Router3(config)#no router ospf 1

Router3(config)#router ospf 1
Router3(config-router)#router-id 3.3.3.3
Router3(config-router)#network 192.168.3.0 0.0.0.255 area 3
Router3(config-router)#network 192.168.7.0 0.0.0.3 area 0
Router3(config-router)#network 192.168.8.0 0.0.0.3 area 0
Router3(config-router)#network 192.168.9.0 0.0.0.3 area 0
Router3(config-router)#exit

Router3(config)#interface serial0/0/0
Router3(config-if)#ip ospf cost 100
Router3(config-if)#ip ospf hello-interval 5
Router3(config-if)#ip ospf dead-interval 20
Router3(config-if)#exit

Router3(config)#interface serial0/0/1
Router3(config-if)#ip ospf cost 100
Router3(config-if)#ip ospf hello-interval 5
Router3(config-if)#ip ospf dead-interval 20
Router3(config-if)#exit

Router3(config)#interface serial0/1/0
Router3(config-if)#ip ospf cost 100
Router3(config-if)#ip ospf hello-interval 5
Router3(config-if)#ip ospf dead-interval 20
Router3(config-if)#exit

Router3(config)#exit
Router3#write memory
```

##### Router4 - Configuración OSPF

```c
Router4>enable
Router4#configure terminal
Router4(config)#no router ospf 1

Router4(config)#router ospf 1
Router4(config-router)#router-id 4.4.4.4
Router4(config-router)#network 192.168.2.0 0.0.0.255 area 4
Router4(config-router)#network 192.168.5.0 0.0.0.3 area 0
Router4(config-router)#network 192.168.8.0 0.0.0.3 area 0
Router4(config-router)#network 192.168.10.0 0.0.0.3 area 0
Router4(config-router)#exit

Router4(config)#interface serial0/0/0
Router4(config-if)#ip ospf cost 100
Router4(config-if)#ip ospf hello-interval 5
Router4(config-if)#ip ospf dead-interval 20
Router4(config-if)#exit

Router4(config)#interface serial0/0/1
Router4(config-if)#ip ospf cost 100
Router4(config-if)#ip ospf hello-interval 5
Router4(config-if)#ip ospf dead-interval 20
Router4(config-if)#exit

Router4(config)#interface serial0/1/0
Router4(config-if)#ip ospf cost 100
Router4(config-if)#ip ospf hello-interval 5
Router4(config-if)#ip ospf dead-interval 20
Router4(config-if)#exit

Router4(config)#exit
Router4#write memory
```

![Router4 configuración OSPF][router4-sesion-cli-ios-setting-ospf]

[router4-sesion-cli-ios-setting-ospf]: ../images/ejercicio_2-router4-sesion-cli-ios-setting-ospf.png

## Verificación y Pruebas

### 3.1 Verificación de Adyacencias OSPF

El comando show ip ospf neighbor confirma que cada router establece adyacencias con sus tres vecinos directos.
Resultados esperados:

- Router1: 3 vecinos (2.2.2.2, 3.3.3.3, 4.4.4.4) en estado FULL
- Router2: 3 vecinos (1.1.1.1, 3.3.3.3, 4.4.4.4) en estado FULL
- Router3: 3 vecinos (1.1.1.1, 2.2.2.2, 4.4.4.4) en estado FULL
- Router4: 3 vecinos (1.1.1.1, 2.2.2.2, 3.3.3.3) en estado FULL

| Router1 - Vecinos OSPF | Router1 - Vecinos OSPF |
|:----------------:|:----------------:|
| ![Router1 - Vecinos OSPF](ejercicio_2-router1-check-conf.png) | ![Router2 - Vecinos OSPF](ejercicio_2-router2-check-conf.png) |

| Router3 - Vecinos OSPF | Router4 - Vecinos OSPF |
|:----------------:|:----------------:|
| ![Router3 - Vecinos OSPF](ejercicio_2-router3-check-conf.png) | ![Router4 - Vecinos OSPF](ejercicio_2-router4-check-conf.png) |

### 3.2 Verificación de Tabla de Enrutamiento

#### Router1 - Rutas OSPF

```c
Router1>enable
Router1#show ip route ospf
O IA 192.168.2.0 [110/101] via 192.168.5.2, 00:31:13, Serial0/0/0
O IA 192.168.3.0 [110/165] via 192.168.5.2, 00:31:13, Serial0/0/0
O IA 192.168.4.0 [110/101] via 192.168.6.2, 00:57:29, Serial0/0/1
     192.168.7.0/30 is subnetted, 1 subnets
O       192.168.7.0 [110/200] via 192.168.6.2, 00:57:29, Serial0/0/1
     192.168.8.0/30 is subnetted, 1 subnets
O       192.168.8.0 [110/164] via 192.168.5.2, 00:31:13, Serial0/0/0
     192.168.10.0/30 is subnetted, 1 subnets
O       192.168.10.0 [110/164] via 192.168.5.2, 00:31:13, Serial0/0/0
```

#### Router2 - Rutas OSPF

```c
Router2>enable
Router2#show ip route ospf
O IA 192.168.1.0 [110/101] via 192.168.6.1, 00:59:00, Serial0/0/0
O IA 192.168.2.0 [110/201] via 192.168.6.1, 00:32:39, Serial0/0/0
O IA 192.168.3.0 [110/265] via 192.168.6.1, 00:32:39, Serial0/0/0
     192.168.5.0/30 is subnetted, 1 subnets
O       192.168.5.0 [110/200] via 192.168.6.1, 00:59:00, Serial0/0/0
     192.168.8.0/30 is subnetted, 1 subnets
O       192.168.8.0 [110/264] via 192.168.6.1, 00:32:39, Serial0/0/0
     192.168.9.0/30 is subnetted, 1 subnets
O       192.168.9.0 [110/200] via 192.168.6.1, 00:59:00, Serial0/0/0
```

#### Router3 - Rutas OSPF

```c
Router3>enable
Router3#show ip route ospf
O IA 192.168.1.0 [110/165] via 192.168.8.2, 00:28:26, Serial0/0/1
O IA 192.168.2.0 [110/65] via 192.168.8.2, 00:28:26, Serial0/0/1
O IA 192.168.4.0 [110/265] via 192.168.8.2, 00:28:26, Serial0/0/1
     192.168.5.0/30 is subnetted, 1 subnets
O       192.168.5.0 [110/164] via 192.168.8.2, 00:28:26, Serial0/0/1
     192.168.6.0/30 is subnetted, 1 subnets
O       192.168.6.0 [110/264] via 192.168.8.2, 00:28:26, Serial0/0/1
     192.168.10.0/30 is subnetted, 1 subnets
O       192.168.10.0 [110/128] via 192.168.8.2, 00:28:26, Serial0/0/1
```

#### Router4 - Rutas OSPF

```c
Router4>enable
Router4#show ip route ospf
O IA 192.168.1.0 [110/101] via 192.168.5.1, 00:36:56, Serial0/0/0
O IA 192.168.3.0 [110/65] via 192.168.8.1, 00:03:06, Serial0/0/1
O IA 192.168.4.0 [110/201] via 192.168.5.1, 00:36:56, Serial0/0/0
     192.168.6.0/30 is subnetted, 1 subnets
O       192.168.6.0 [110/200] via 192.168.5.1, 00:36:56, Serial0/0/0
     192.168.7.0/30 is subnetted, 1 subnets
O       192.168.7.0 [110/128] via 192.168.8.1, 00:36:56, Serial0/0/1
     192.168.9.0/30 is subnetted, 1 subnets
O       192.168.9.0 [110/128] via 192.168.8.1, 00:36:56, Serial0/0/1
```

**Interpretación:** Las rutas marcadas como "O IA" (OSPF Inter-Area) indican comunicación exitosa entre diferentes áreas OSPF, confirmando el correcto funcionamiento del diseño multi-área.

---

## Resultados y Conclusiones

### Características Implementadas

- **Topología full-mesh:** 4 routers interconectados mediante 6 enlaces WAN
- **Router-IDs únicos:** Identificación clara de cada dispositivo (1.1.1.1 a 4.4.4.4)
- **Diseño multi-área OSPF:** 5 áreas (0 para backbone, 1-4 para sucursales)
- **Convergencia optimizada:** Timers hello/dead reducidos (5/20 segundos vs 10/40 predeterminados)
- **Balanceo de carga:** Cost uniforme de 100 en todos los enlaces WAN
- **Alta disponibilidad:** Múltiples rutas alternativas ante fallas de enlaces

### Conceptos Técnicos Aplicados

|Concepto| Descripción|
|:--| :--|
|OSPF Multi-Área| Diseño jerárquico que mejora escalabilidad y reduce overhead|
|Router-ID| Identificador único para cada router en el dominio OSPF|
|Topología Full-Mesh|Interconexión completa que maximiza redundancia|
|Hello/Dead Timers|Intervalos para detección rápida de fallas (convergencia acelerada)|
|OSPF Cost|Métrica utilizada para cálculo de rutas óptimas|
|Wildcard Mask|Notación inversa de máscara usada en comandos network de OSPF|


### Ventajas de la Solución

1. **Redundancia Total:** Falla de hasta 2 enlaces simultáneos sin pérdida de conectividad
2. **Convergencia Rápida:** Detección de fallas en 20 segundos (vs 40 seg estándar)
3. **Escalabilidad:** Diseño multi-área facilita crecimiento futuro
4. **Balanceo de Carga:** Distribución automática de tráfico entre rutas de igual costo
5. **Administración Simplificada:** Router-IDs únicos facilitan troubleshooting

### Futuras ampliaciones / Recomendaciones

Para entornos de producción, se sugiere:

- Implementar autenticación OSPF (MD5 o SHA) para mayor seguridad
- Configurar route summarization en ABRs (Area Border Routers)
- Establecer políticas de QoS sobre los enlaces WAN
- Monitorear métricas OSPF mediante herramientas de gestión de red (SNMP/NetFlow)
- Documentar procedimientos de respaldo y recuperación ante desastres

## Referencias

- RFC 2328: OSPF Version 2
- Cisco IOS Configuration Guide - OSPF
- Documentación oficial de Packet Tracer
