# Enunciado

Divide la dirección IP 192.168.2.0/24 en 4 subredes. ¿Cuáles son las direcciones IP de inicio y fin para cada subred?

# Análisis y respuesta

Aplicación de la guía completa a este escenario de Clase C:

# Aplicación de la Guía: Caso 192.168.2.0/24 → 4 Subredes

## PASO 1: IDENTIFICAR
**Datos del problema:**

- Red original: `192.168.2.0/24` (Clase C privada)
- Subredes necesarias: **4**

## PASO 2: BUSCAR en la "Escalera de Potencias"
Consultando nuestra tabla nemotécnica:
```
2^1 = 2    ❌ (insuficiente)
2^2 = 4    ✅ (¡exacto!)
```

**Resultado:** Necesitamos **2 bits prestados**

## PASO 3: CALCULAR Nueva Máscara
Aplicando la fórmula maestra:
```
nueva_máscara = máscara_original + bits_prestados
nueva_máscara = /24 + 2 = /26
```

**Respuesta: La máscara debe ser /26**

## PASO 4: VERIFICAR Factibilidad
```
/26 ≤ 30 ✅ (factible para LANs)
```

## PASO 5: APLICAR Método del "Salto Mágico"

### Conversión a decimal

`/26 = 255.255.255.192`

### Cálculo del salto

```
Salto = 256 - 192 = 64
```

## DIRECCIONES DE CADA SUBRED

### **Subred 1: 192.168.2.0/26**

- **Rango completo:** 192.168.2.0 - 192.168.2.63
- **Dirección de red:** 192.168.2.0
- **Primera IP utilizable:** 192.168.2.1
- **Última IP utilizable:** 192.168.2.62
- **Dirección de broadcast:** 192.168.2.63

### **Subred 2: 192.168.2.64/26**

- **Rango completo:** 192.168.2.64 - 192.168.2.127
- **Dirección de red:** 192.168.2.64
- **Primera IP utilizable:** 192.168.2.65
- **Última IP utilizable:** 192.168.2.126
- **Dirección de broadcast:** 192.168.2.127

### **Subred 3: 192.168.2.128/26**

- **Rango completo:** 192.168.2.128 - 192.168.2.191
- **Dirección de red:** 192.168.2.128
- **Primera IP utilizable:** 192.168.2.129
- **Última IP utilizable:** 192.168.2.190
- **Dirección de broadcast:** 192.168.2.191

### **Subred 4: 192.168.2.192/26**

- **Rango completo:** 192.168.2.192 - 192.168.2.255
- **Dirección de red:** 192.168.2.192
- **Primera IP utilizable:** 192.168.2.193
- **Última IP utilizable:** 192.168.2.254
- **Dirección de broadcast:** 192.168.2.255

## VERIFICACIÓN MATEMÁTICA

### Test de Consistencia

```
Direcciones originales: 2^(32-24) = 256
Subredes creadas: 2^2 = 4
Hosts por subred: 2^(32-26) - 2 = 62
Total: 4 × 64 = 256 ✅
```

### Referencia con la Tabla de Clase C

Consultando nuestra tabla para Clase C privada:

- **4 subredes** → **2 bits prestados** → **/26** ✅

## RESUMEN EJECUTIVO

**Máscara utilizada: /26 (255.255.255.192)**

- **4 subredes exactas con salto de 64**
- **62 hosts utilizables por subred**
- **Distribución perfecta sin desperdicio de direcciones**

