# Enunciado

Tienes la dirección IP 172.30.0.0/16 y necesitas 64 subredes. ¿Cuál debe ser la máscara de subred?

# Aplicación de la Guía: Caso 172.30.0.0/16 → 64 Subredes

## PASO 1: IDENTIFICAR

**Datos del problema:**

- Red original: `172.30.0.0/16` (Clase B privada)
- Subredes necesarias: **64**

## PASO 2: BUSCAR en la "Escalera de Potencias"
Consultando nuestra tabla nemotécnica:
```
2^1 = 2    ❌ (muy pocas)
2^2 = 4    ❌ (insuficiente)  
2^3 = 8    ❌ (insuficiente)
2^4 = 16   ❌ (insuficiente)
2^5 = 32   ❌ (insuficiente)
2^6 = 64   ✅ (¡exacto!)
```

**Resultado:** Necesitamos **6 bits prestados**

## PASO 3: CALCULAR Nueva Máscara

Aplicando la fórmula maestra:
```
nueva_máscara = máscara_original + bits_prestados
nueva_máscara = /16 + 6 = /22
```

**Respuesta: La máscara debe ser /22**

## PASO 4: VERIFICAR Factibilidad
```
/22 ≤ 30 ✅ (factible para LANs)
```

## PASO 5: APLICAR Método del "Salto Mágico"

### Conversión a decimal
`/22 = 255.255.252.0`

### Cálculo del salto
```
Salto = 256 - 252 = 4
```

### Distribución de las 64 subredes (ejemplos)
```
172.30.0.0/22   → (172.30.0.0 - 172.30.3.255)
172.30.4.0/22   → (172.30.4.0 - 172.30.7.255)  
172.30.8.0/22   → (172.30.8.0 - 172.30.11.255)
172.30.12.0/22  → (172.30.12.0 - 172.30.15.255)
⋮ (incrementando de 4 en 4 en el tercer octeto)
172.30.252.0/22 → (172.30.252.0 - 172.30.255.255)
```

## VERIFICACIÓN MATEMÁTICA

### Test de Consistencia
```
Direcciones originales: 2^(32-16) = 65,536
Subredes creadas: 2^6 = 64
Hosts por subred: 2^(32-22) - 2 = 1,022
Total: 64 × 1,024 = 65,536 ✅
```

### Referencia con la Tabla de Clase B
Interpolando en nuestra tabla para Clase B privada:

- **16 subredes** → **/20** (4 bits prestados)
- **256 subredes** → **/24** (8 bits prestados)
- **64 subredes** → **/22** (6 bits prestados) ✅

## CARACTERÍSTICAS DE CADA SUBRED

- **Hosts utilizables por subred:** 1,022
- **Direcciones totales por subred:** 1,024
- **Salto entre subredes:** 4 (en el tercer octeto)
- **Rango por subred:** 4 direcciones clase C consecutivas

## RESULTADO FINAL

**Máscara de subred requerida: /22 (255.255.252.0)**

- **64 subredes exactas**
- **1,022 hosts utilizables por subred**
- **Salto de 4 en el tercer octeto**
- **Distribución eficiente sin desperdicios**

