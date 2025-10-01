# Enunciado

Si tienes la dirección IP 192.168.3.0/24 y deseas dividirla en 2 subredes, ¿cuál será la máscara de subred y las direcciones de inicio y fin para cada subred?

¡Perfecto! Apliquemos mi guía completa a este escenario básico pero fundamental:

# Aplicación de la Guía: Caso 192.168.3.0/24 → 2 Subredes

## PASO 1: IDENTIFICAR
**Datos del problema:**

- Red original: `192.168.3.0/24` (Clase C privada)
- Subredes necesarias: **2**

## PASO 2: BUSCAR en la "Escalera de Potencias"
Consultando nuestra tabla nemotécnica:
```
2^1 = 2    ✅ (¡exacto!)
```

**Resultado:** Necesitamos **1 bit prestado**

## PASO 3: CALCULAR Nueva Máscara
Aplicando la fórmula maestra:
```
nueva_máscara = máscara_original + bits_prestados
nueva_máscara = /24 + 1 = /25
```

**Respuesta: La máscara debe ser /25**

## PASO 4: VERIFICAR Factibilidad
```
/25 ≤ 30 ✅ (factible para LANs)
```

## PASO 5: APLICAR Método del "Salto Mágico"

### Conversión a decimal

`/25 = 255.255.255.128`

### Cálculo del salto

```
Salto = 256 - 128 = 128
```

## DIRECCIONES DE LAS 2 SUBREDES

### **Subred 1: 192.168.3.0/25**

- **Rango completo:** 192.168.3.0 - 192.168.3.127
- **Dirección de red:** 192.168.3.0
- **Primera IP utilizable:** 192.168.3.1
- **Última IP utilizable:** 192.168.3.126
- **Dirección de broadcast:** 192.168.3.127

### **Subred 2: 192.168.3.128/25**

- **Rango completo:** 192.168.3.128 - 192.168.3.255
- **Dirección de red:** 192.168.3.128
- **Primera IP utilizable:** 192.168.3.129
- **Última IP utilizable:** 192.168.3.254
- **Dirección de broadcast:** 192.168.3.255

## VERIFICACIÓN MATEMÁTICA

### Test de Consistencia

```
Direcciones originales: 2^(32-24) = 256
Subredes creadas: 2^1 = 2
Hosts por subred: 2^(32-25) - 2 = 126
Total: 2 × 128 = 256 ✅
```

### Referencia con la Tabla de Clase C

Consultando nuestra tabla para Clase C privada:

- **2 subredes** → **1 bit prestado** → **/25** ✅

## CARACTERÍSTICAS DE CADA SUBRED

- **Hosts utilizables por subred:** 126
- **Direcciones totales por subred:** 128
- **Salto entre subredes:** 128 (en el cuarto octeto)
- **División perfecta:** Mitad superior e inferior de la red original

## PATRÓN BINARIO EXPLICATIVO

```
Original /24: 11111111.11111111.11111111.00000000
Nueva /25:    11111111.11111111.11111111.10000000
              ↑ Bit prestado para crear 2 subredes
```

## RESULTADO FINAL

**Máscara utilizada: /25 (255.255.255.128)**

- **2 subredes exactas con salto de 128**
- **126 hosts utilizables por subred**
- **División binaria perfecta (0-127 y 128-255)**
- **Caso más simple de subnetting en Clase C**
