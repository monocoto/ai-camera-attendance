#!/bin/bash
set -e

PROJECT_DIR="$(cd "$(dirname "$0")" && pwd)"

cd $PROJECT_DIR
echo "Working directory: ${PROJECT_DIR}"
echo "Run the AI camera application server."

docker container run --rm -p "8501:8501" --network bridge \
  -v $(pwd)/.streamlit/secrets.toml:/app/.streamlit/secrets.toml \
  -v $(pwd)/persons:/app/persons monocoto/stmlt-fcrcg:latest

echo
echo "--------------"
echo "SHUTDOWN."
echo "--------------"
