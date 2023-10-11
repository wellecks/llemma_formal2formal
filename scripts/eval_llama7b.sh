MAX_ITERS=100
NUM_SAMPLES=32
TEMPERATURES="0.0"
TIMEOUT=600
NUM_SHARDS=4
DATASET="minif2f-test"
DATA="data/minif2f.jsonl"

MODEL="codellama/CodeLlama-7b-hf"
NAME="codellama7b"

OUTPUT_DIR="output/${NAME}_minif2f_test"

for SHARD in 0 1 2 3
do
  CUDA_VISIBLE_DEVICES=${SHARD} python proofsearch.py --dataset-name ${DATASET} --temperatures ${TEMPERATURES} --timeout ${TIMEOUT} --num-shards ${NUM_SHARDS} --shard ${SHARD} --model-name ${MODEL} --max-iters ${MAX_ITERS} --dataset-path ${DATA} --num-samples ${NUM_SAMPLES} --early-stop --output-dir ${OUTPUT_DIR} &> ${NAME}_shard${SHARD}.out &
done

