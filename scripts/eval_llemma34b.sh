MAX_ITERS=100
NUM_SAMPLES=32
TEMPERATURES="0.0"
TIMEOUT=600
NUM_SHARDS=1
DATASET="minif2f-test"
DATA="data/minif2f.jsonl"

MODEL="open-web-math/llemma_34b"
NAME="llemma_34b"

OUTPUT_DIR="output/${NAME}_minif2f_test"

SHARD=0
python proofsearch.py --tp-degree 2 --dataset-name ${DATASET} --temperatures ${TEMPERATURES} --timeout ${TIMEOUT} --num-shards ${NUM_SHARDS} --shard ${SHARD} --model-name ${MODEL} --max-iters ${MAX_ITERS} --dataset-path ${DATA} --num-samples ${NUM_SAMPLES} --early-stop --output-dir ${OUTPUT_DIR} &> ${NAME}_shard${SHARD}.out &
