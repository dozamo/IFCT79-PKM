# Enunciado

Una red tiene la dirección IP 198.51.100.0/24. Divide esta red en 6 subredes utilizando una mascara de /26. Proporciona las direcciones de inicio y fin para cada subred.

# Análisis

- Aplicación de la Guía: Problema Matemático Detectado

## ANÁLISIS INICIAL CON LA GUÍA

**Datos del problema:**

- Red original: `198.51.100.0/24`
- Subredes solicitadas: **6**
- Máscara propuesta: **/26**

## PASO 1: VERIFICACIÓN MATEMÁTICA

Aplicando la "Escalera de Potencias":
```
Bits prestados = /26 - /24 = 2 bits
Subredes posibles = 2^2 = 4 subredes
```

**🚨 ERROR DETECTADO:**

- **Solicitas:** 6 subredes
- **Máscara /26 permite:** Solo 4 subredes
- **Conclusión:** Matemáticamente imposible

## SOLUCIONES CORRECTAS

### OPCIÓN A: Mantener 6 subredes (Cambiar máscara)

**Aplicando la guía para 6 subredes:**
```
2^1 = 2    ❌ (insuficiente)
2^2 = 4    ❌ (insuficiente)  
2^3 = 8    ✅ (suficiente para 6)
```

**Máscara necesaria:** `/27`

- Bits prestados: 3
- Subredes disponibles: 8 (usarías 6 de 8)
- Hosts por subred: 30

### OPCIÓN B: Mantener /26 (Cambiar número de subredes)

**Con máscara /26 obtienes exactamente 4 subredes:**

#### **Subred 1: 198.51.100.0/26**

- **Rango:** 198.51.100.0 - 198.51.100.63
- **Utilizable:** 198.51.100.1 - 198.51.100.62

#### **Subred 2: 198.51.100.64/26**

- **Rango:** 198.51.100.64 - 198.51.100.127
- **Utilizable:** 198.51.100.65 - 198.51.100.126

#### **Subred 3: 198.51.100.128/26**

- **Rango:** 198.51.100.128 - 198.51.100.191
- **Utilizable:** 198.51.100.129 - 198.51.100.190

#### **Subred 4: 198.51.100.192/26**

- **Rango:** 198.51.100.192 - 198.51.100.255
- **Utilizable:** 198.51.100.193 - 198.51.100.254

## RECOMENDACIÓN PROFESIONAL

**Para 6 subredes, usa /27:**

| Subred | Red | Rango Completo | IPs Utilizables |
|--------|-----|----------------|-----------------|
| 1 | 198.51.100.0/27 | .0 - .31 | .1 - .30 |
| 2 | 198.51.100.32/27 | .32 - .63 | .33 - .62 |
| 3 | 198.51.100.64/27 | .64 - .95 | .65 - .94 |
| 4 | 198.51.100.96/27 | .96 - .127 | .97 - .126 |
| 5 | 198.51.100.128/27 | .128 - .159 | .129 - .158 |
| 6 | 198.51.100.160/27 | .160 - .191 | .161 - .190 |

**Sobrantes:** 2 subredes adicionales disponibles (.192/27 y .224/27)

## CONCLUSIÓN

La guía detectó una **inconsistencia matemática** en el problema planteado. ¿Prefieres ajustar la máscara a /27 para obtener 6 subredes, o mantener /26 con solo 4 subredes?