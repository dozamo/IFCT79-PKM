# Enunciado

Supongamos que tienes la dirección IP `10.0.0.0/8` y necesitas crear 32 subredes. ¿Cuál debe ser la máscara de subred?


¡Perfecto! Apliquemos mi guía paso a paso a este escenario real:

# Aplicación de la Guía: Caso 10.0.0.0/8 → 32 Subredes

## PASO 1: IDENTIFICAR
**Datos del problema:**

- Red original: `10.0.0.0/8` (Clase A privada)
- Subredes necesarias: **32**

## PASO 2: BUSCAR en la "Escalera de Potencias"

Consultando nuestra tabla nemotécnica:
```
2^1 = 2    ❌ (muy pocas)
2^2 = 4    ❌ (insuficiente)  
2^3 = 8    ❌ (insuficiente)
2^4 = 16   ❌ (insuficiente)
2^5 = 32   ✅ (¡exacto!)
```

**Resultado:** Necesitamos **5 bits prestados**

## PASO 3: CALCULAR Nueva Máscara
Aplicando la fórmula maestra:

```
nueva_máscara = máscara_original + bits_prestados
nueva_máscara = /8 + 5 = /13
```

**Respuesta: La máscara debe ser /13**

## PASO 4: VERIFICAR Factibilidad

```
/13 ≤ 30 ✅ (factible para LANs)
```

## PASO 5: APLICAR Método del "Salto Mágico"

### Conversión a decimal

`/13 = 255.248.0.0`

### Cálculo del salto

```
Salto = 256 - 248 = 8
```

### Distribución de las 32 subredes
```
10.0.0.0/13   → (10.0.0.0 - 10.7.255.255)
10.8.0.0/13   → (10.8.0.0 - 10.15.255.255)  
10.16.0.0/13  → (10.16.0.0 - 10.23.255.255)
10.24.0.0/13  → (10.24.0.0 - 10.31.255.255)
⋮
10.248.0.0/13 → (10.248.0.0 - 10.255.255.255)
```

## VERIFICACIÓN MATEMÁTICA

### Test de Consistencia

```
Direcciones originales: 2^(32-8) = 16,777,216
Subredes creadas: 2^5 = 32
Hosts por subred: 2^(32-13) - 2 = 524,286
Total: 32 × 524,288 = 16,777,216 ✅
```

### Referencia con la Tabla de Clase A

Consultando nuestra tabla para Clase A privada:

- **32 subredes** → **5 bits prestados** → **/13** ✅

## RESULTADO FINAL

**Máscara de subred requerida: /13 (255.248.0.0)**

- **32 subredes exactas**
- **524,286 hosts utilizables por subred**
- **Salto de 8 en el segundo octeto**
