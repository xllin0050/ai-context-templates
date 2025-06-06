#!/bin/bash

# AI Context 初始化腳本 - 簡化版

set -e

# 顏色定義
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m'

print_message() {
    echo -e "${GREEN}[AI-Context]${NC} $1"
}

print_info() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

# 建立 active-context 目錄
print_message "建立專案配置..."
mkdir -p active-context

# 獲取專案資訊
print_message "請輸入專案資訊："
read -p "專案名稱: " PROJECT_NAME
read -p "專案描述: " PROJECT_DESCRIPTION

# 選擇技術棧
echo
print_info "選擇前端框架："
echo "1) React Router 7"
echo "2) SvelteKit" 
echo "3) Nuxt"
echo "4) 純前端 (無框架)"

read -p "選擇 (1-4): " FRONTEND_CHOICE

case $FRONTEND_CHOICE in
    1) FRONTEND_PRESET="react-router7" ;;
    2) FRONTEND_PRESET="sveltekit" ;;
    3) FRONTEND_PRESET="nuxt" ;;
    4) FRONTEND_PRESET="none" ;;
    *) FRONTEND_PRESET="react-router7" ;;
esac

echo
print_info "選擇後端 (可選)："
echo "1) 無後端 (純前端 + 雲端服務)"
echo "2) Node.js + Express"
echo "3) Python FastAPI"
echo "4) Python Flask"

read -p "選擇 (1-4): " BACKEND_CHOICE

case $BACKEND_CHOICE in
    1) BACKEND_PRESET="none" ;;
    2) BACKEND_PRESET="node-express" ;;
    3) BACKEND_PRESET="python-fastapi" ;;
    4) BACKEND_PRESET="python-flask" ;;
    *) BACKEND_PRESET="none" ;;
esac
