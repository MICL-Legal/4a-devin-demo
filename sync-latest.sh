#!/bin/sh
# 把編號最大的 Vn/ 資料夾內容同步覆蓋回根目錄（= 目前線上版本要發布的內容）。
# 用法：在 repo 根目錄執行 `sh sync-latest.sh`，確認 diff 後自行 git add / commit / push。
set -e

latest=$(ls -d V[0-9]* 2>/dev/null | sed 's/^V//' | sort -n | tail -1)
if [ -z "$latest" ]; then
  echo "找不到任何 V0, V1, ... 資料夾" >&2
  exit 1
fi

dir="V${latest}"
echo "最新版本：${dir}"
cp "${dir}/README.md" "${dir}/index.html" .
[ -d "${dir}/assets" ] && cp -r "${dir}/assets" .
find "${dir}" -maxdepth 1 -name '*.html' ! -name 'index.html' -exec cp {} . \;
echo "已將 ${dir}/README.md、index.html、assets/（如果有）、其他 .html 頁面同步覆蓋到根目錄。"
echo "接下來請自行檢查 git status / diff，再 commit + push 上線。"
