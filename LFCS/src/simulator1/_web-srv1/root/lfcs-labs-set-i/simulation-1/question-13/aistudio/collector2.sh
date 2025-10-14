#!/bin/bash
# Simula un proceso "malo" que usa la syscall kill
echo "collector2 started. PID: $$"

# Función para lanzar una nueva "víctima"
launch_victim() {
    sleep 30 & # Un sleep más corto para más iteraciones de kill
    echo "collector2 launched new victim with PID: $!"
    echo $! > /tmp/collector2_victim_pid.txt # Guardamos el PID de la víctima en un archivo
}

# Lanzar la primera víctima
launch_victim
VICTIM_PID=$(cat /tmp/collector2_victim_pid.txt)

# Bucle principal del collector2
while true; do
    echo "collector2 running normally, checking for kill opportunity..."
    sleep 2 # Ejecuta normalmente por un tiempo

    # Obtener el PID actual de la víctima
    CURRENT_VICTIM_PID=$(cat /tmp/collector2_victim_pid.txt)

    if ps -p "$CURRENT_VICTIM_PID" > /dev/null; then # Verificar si la víctima sigue viva
        echo "collector2 attempting to kill victim PID $CURRENT_VICTIM_PID..."
        # ¡Aquí es donde se invoca la syscall 'kill'!
        kill -9 "$CURRENT_VICTIM_PID"
        if [ $? -eq 0 ]; then
            echo "collector2 successfully sent SIGKILL to $CURRENT_VICTIM_PID."
        else
            echo "collector2 failed to send SIGKILL to $CURRENT_VICTIM_PID. Error: $?."
        fi
        # Después de intentar matar, lanzamos una nueva víctima si la actual murió
        # para tener siempre un objetivo.
        if ! ps -p "$CURRENT_VICTIM_PID" > /dev/null; then
            echo "Victim PID $CURRENT_VICTIM_PID is now dead. Launching a new one."
            launch_victim
            VICTIM_PID=$(cat /tmp/collector2_victim_pid.txt)
        fi
    else
        echo "Victim PID $CURRENT_VICTIM_PID is already dead. Launching a new one."
        launch_victim # Lanza una nueva víctima si la anterior ya murió
        VICTIM_PID=$(cat /tmp/collector2_victim_pid.txt)
    fi

    sleep 1 # Pausa breve después del intento de kill
done
