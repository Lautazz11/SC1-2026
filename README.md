# Temas del Cursado: Sistemas de Control 1

### 🔹 Unidad 1: Introducción y Fundamentos Matemáticos
* **Conceptos de Control:** Sistemas de lazo abierto vs. lazo cerrado (realimentados), señales de control (setpoint, error, variable manipulada, salida) y componentes principales.
* **Herramientas Matemáticas:** Transformada de Laplace, propiedades, Teorema del Valor Final e Inicial, y análisis de polos y ceros.

### 🔹 Unidad 2: Representaciones de Sistemas Lineales (SLIT)
* **Modelado en Laplace:** Función de Transferencia (FT) y ecuaciones dinámicas.
* **Técnicas de Reducción:** Álgebra de diagramas de bloques y simplificación de lazos.
* **Gráficos de Flujo de Señal:** Diagramas de flujo y cálculo de transferencias mediante la **Fórmula de Ganancia de Mason**.

### 🔹 Unidad 3: Modelado Matemático de Sistemas Físicos
* **Sistemas Físicos:** Modelado de sistemas mecánicos (traslación y rotación), eléctricos (RLC) y electromecánicos (Motor de Corriente Continua).
* **Implementación Analógica:** Sensores, transductores y realización física de leyes de control PID mediante amplificadores operacionales (OpAmps).

### 🔹 Unidad 4: Análisis y Diseño en el Dominio del Tiempo
* **Respuesta Temporal:** Análisis de sistemas de 1.º y 2.º orden ante entradas típicas (escalón, rampa), parámetros transitorios (sobrepasamiento $M_p$, tiempo de establecimiento $t_s$, amortiguamiento $\zeta$, frecuencia natural $\omega_n$) e identificación de sistemas.
* **Error en Estado Estable ($e_{ss}$):** Clasificación por tipo de sistema y constantes estáticas de error ($K_p, K_v, K_a$).
* **Estabilidad Absoluta y Relativa:** Criterio algebraico de Routh-Hurwitz.
* **Lugar Geométrico de las Raíces (LDR / Root Locus):** Trazado, patrones de respuesta y análisis de polos dominantes.
* **Diseño de Compensadores:** Controladores PID, técnica de Cancelación de Polos Dominantes y Método de la Bisectriz.

### 🔹 Unidad 5: Análisis y Diseño en el Dominio de la Frecuencia
* **Herramientas Frecuenciales:** Diagramas de Bode, Nyquist y Carta de Nichols.
* **Márgenes de Estabilidad:** Margen de Fase ($MF$) y Margen de Ganancia ($MG$).
* **Compensación en Frecuencia:** Diseño de redes compensadoras de adelanto, atraso y atraso-adelanto de fase.

### 🔹 Unidad 6: Control Digital y Herramientas Computacionales
* **Control Digital:** Discretización de sistemas analógicos y aproximaciones de controladores PID discretos.
* **Simulación y Software:** Resolución de ejercitación y diseño de compensadores mediante **GNU Octave / MATLAB**.
* **Trabajo Final Integrador (TFI):** Modelado, simulación y validación del control de una planta física.