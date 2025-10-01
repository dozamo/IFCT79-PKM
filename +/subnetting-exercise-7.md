# Enunciado

Divide la red 10.10.0.0/16 en 16 subredes utilizando la máscara de subred adecuada. Proporciona las direcciones de inicio y fin para cada subred.

#### REVISAR/PRACTICAR 

- Datos iniciales:
IP LAN: 10.10.0.0/16
Subredes solicitadas: 16

2. En escalera de potencias ver subredes necesarias

- Subredes necesarias: `2^4` (n=4)

3. Calculo nueva mascara

- nueva_máscara = máscara_original + n = `16+4` = `20`

11111111 11111111 11111111 11111111

---

Aplicar guía completa a este escenario:

# Aplicación de la Guía: Caso 10.10.0.0/16 → 16 Subredes

## PASO 1: IDENTIFICAR
**Datos del problema:**

- Red original: `10.10.0.0/16` (Dentro del rango Clase A privada)
- Subredes necesarias: **16**

## PASO 2: BUSCAR en la "Escalera de Potencias"

Consultando nuestra tabla nemotécnica:

```
2^1 = 2    ❌ (insuficiente)
2^2 = 4    ❌ (insuficiente)  
2^3 = 8    ❌ (insuficiente)
2^4 = 16   ✅ (¡exacto!)
```

**Resultado:** Necesitamos **4 bits prestados**

## PASO 3: CALCULAR Nueva Máscara
Aplicando la fórmula maestra:
```
nueva_máscara = máscara_original + bits_prestados
nueva_máscara = /16 + 4 = /20
```

**Respuesta: La máscara debe ser /20**

## PASO 4: VERIFICAR Factibilidad
```
/20 ≤ 30 ✅ (factible para LANs)
```

## PASO 5: APLICAR Método del "Salto Mágico"

### Conversión a decimal
`/20 = 255.255.240.0`

### Cálculo del salto
```
Salto = 256 - 240 = 16
```

## DIRECCIONES DE LAS 16 SUBREDES

| Subred | Red | Rango Completo | Direcciones Utilizables |
|--------|-----|----------------|-------------------------|
| 1 | 10.10.0.0/20 | 10.10.0.0 - 10.10.15.255 | 10.10.0.1 - 10.10.15.254 |
| 2 | 10.10.16.0/20 | 10.10.16.0 - 10.10.31.255 | 10.10.16.1 - 10.10.31.254 |
| 3 | 10.10.32.0/20 | 10.10.32.0 - 10.10.47.255 | 10.10.32.1 - 10.10.47.254 |
| 4 | 10.10.48.0/20 | 10.10.48.0 - 10.10.63.255 | 10.10.48.1 - 10.10.63.254 |
| 5 | 10.10.64.0/20 | 10.10.64.0 - 10.10.79.255 | 10.10.64.1 - 10.10.79.254 |
| 6 | 10.10.80.0/20 | 10.10.80.0 - 10.10.95.255 | 10.10.80.1 - 10.10.95.254 |
| 7 | 10.10.96.0/20 | 10.10.96.0 - 10.10.111.255 | 10.10.96.1 - 10.10.111.254 |
| 8 | 10.10.112.0/20 | 10.10.112.0 - 10.10.127.255 | 10.10.112.1 - 10.10.127.254 |
| 9 | 10.10.128.0/20 | 10.10.128.0 - 10.10.143.255 | 10.10.128.1 - 10.10.143.254 |
| 10 | 10.10.144.0/20 | 10.10.144.0 - 10.10.159.255 | 10.10.144.1 - 10.10.159.254 |
| 11 | 10.10.160.0/20 | 10.10.160.0 - 10.10.175.255 | 10.10.160.1 - 10.10.175.254 |
| 12 | 10.10.176.0/20 | 10.10.176.0 - 10.10.191.255 | 10.10.176.1 - 10.10.191.254 |
| 13 | 10.10.192.0/20 | 10.10.192.0 - 10.10.207.255 | 10.10.192.1 - 10.10.207.254 |
| 14 | 10.10.208.0/20 | 10.10.208.0 - 10.10.223.255 | 10.10.208.1 - 10.10.223.254 |
| 15 | 10.10.224.0/20 | 10.10.224.0 - 10.10.239.255 | 10.10.224.1 - 10.10.239.254 |
| 16 | 10.10.240.0/20 | 10.10.240.0 - 10.10.255.255 | 10.10.240.1 - 10.10.255.254 |

## VERIFICACIÓN MATEMÁTICA

### Test de Consistencia:
```
Direcciones originales: 2^(32-16) = 65,536
Subredes creadas: 2^4 = 16
Hosts por subred: 2^(32-20) - 2 = 4,094
Total: 16 × 4,096 = 65,536 ✅
```

### Referencia con la Tabla de Clase A:
Consultando nuestra tabla para segmento de Clase A:
- **16 subredes** → **4 bits prestados** → **/20** ✅

## CARACTERÍSTICAS DE CADA SUBRED

- **Hosts utilizables por subred:** 4,094
- **Direcciones totales por subred:** 4,096
- **Salto entre subredes:** 16 (en el tercer octeto)
- **Patrón:** Incremento sistemático de 16 en 16

## RESULTADO FINAL

**Máscara utilizada: /20 (255.255.240.0)**
- **16 subredes exactas con salto de 16**
- **4,094 hosts utilizables por subred**
- **Distribución perfecta sin desperdicio de direcciones**
- **Patrón predecible: 10.10.{0,16,32,48,...,240}.0/20**

¡La guía nos proporciona una solución completa y matemáticamente verificada!
