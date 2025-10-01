# Ejercicio 2

Si tienes la direccion IP LAN `172.16.0.0/16` y deseas dividirla en `8` subredes iguales ¿Cual sera la mascara de subred adecuada?

## Aplicación del Método de "Bits Prestados"

**Datos**

- Red original: `172.16.0.0/16`
- Objetivo: `8` subredes iguales

### Paso 1: Usar la "Escalera de Potencias"**

De nuestra tabla nemotécnica:

- `3 bits = 8 subredes` ✓

### Paso 2: Calcular Nueva Máscara**

```bash
Nueva máscara = Máscara_original + Bits_prestados
Nueva máscara = /16 + 3 = /19
```

***Respuesta: La máscara adecuada es /19***

### Paso 3: Encontrar el Salto

```bash
/19 = 255.255.224.0
Salto = 256 - 224 = 32
```

### Paso 4: Distribución de Subredes

Las 8 subredes serían:

```bash
172.16.0.0/19    (0.0 - 31.255)
172.16.32.0/19   (32.0 - 63.255)  
172.16.64.0/19   (64.0 - 95.255)
172.16.96.0/19   (96.0 - 127.255)
172.16.128.0/19  (128.0 - 159.255)
172.16.160.0/19  (160.0 - 191.255)
172.16.192.0/19  (192.0 - 223.255)
172.16.224.0/19  (224.0 - 255.255)
```

