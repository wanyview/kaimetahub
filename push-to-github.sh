#!/bin/bash
# KaiMetaHub GitHub Push Script

echo "🚀 开始推送 KaiMetaHub 到 GitHub..."

cd "$(dirname "$0")"

# 检查是否需要重新配置远程
git remote set-url origin https://wanyview@github.com/wanyview/kaimetahub.git

echo "📤 正在推送到 GitHub..."
git push -u origin main

if [ $? -eq 0 ]; then
    echo "✅ 推送成功！"
    echo "🌐 仓库地址: https://github.com/wanyview/kaimetahub"
else
    echo "❌ 推送失败，请检查 GitHub 认证"
    echo "💡 可能需要运行: git config --global credential.helper osxkeychain"
    echo "💡 然后重新尝试推送"
fi
