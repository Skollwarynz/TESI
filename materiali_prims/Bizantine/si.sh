#!/bin/bash

# Configurazione file e cartelle
MODEL="../Bizantine_protocol.nm"
PROPS="properties.pctl"
OUT_DIR="./risultati_build"
FLAGS="-v -extraddinfo -extrareachinfo -fair"

mkdir -p "$OUT_DIR"
echo "Metodo,Stato,Tempo_CPU,Risultato" >"$OUT_DIR/riassunto.csv"

echo "=== Avvio Build Comparativa PRISM ==="

# 1. Esecuzione PRISM BASE
echo "Esecuzione PRISM Base..."
prism $MODEL $PROPS $FLAGS >"$OUT_DIR/output_base.log" 2>&1

# 2. Esecuzione con SYMPRISM (Symmetry)
echo "Esecuzione con SymPrism..."
# NOTA: se il tuo modello richiede parametri dopo -symm, aggiungili qui (es: -symm N)
prism $MODEL $PROPS $FLAGS -symm >"$OUT_DIR/output_symprism.log" 2>&1

# 3. Esecuzione con GRIP
echo "Esecuzione con GRIP..."
prism $MODEL $PROPS $FLAGS -grip >"$OUT_DIR/output_grip.log" 2>&1

echo "=== Build Completata! ==="
echo "Trovi i log dettagliati nella cartella '$OUT_DIR'."
