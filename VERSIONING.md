# 本機版本管理（V0 / V1 …）

這個 repo 除了 git 本身的版本歷史之外，額外用**資料夾快照**做一層更直覺的本機版本管理。

## 資料夾角色

| 位置 | 角色 |
|---|---|
| `V0/` | **基準快照**，2026-08-14 建立，內容 = 當時根目錄的 `README.md` / `index.html`（等於目前線上版本）。之後**不再修改**，永遠留著當初的樣子供對照。 |
| `V1/` | **目前工作副本**。從 `V0/` 複製而來，**後續所有修改都在這裡進行**，不要直接改根目錄。 |
| 根目錄 `README.md` / `index.html` | **目前線上版本**（GitHub Pages 從根目錄發布 `main` branch）。平常不直接編輯；等 `V1/` 改到一個段落、確認要上線時，才把 `V1/` 的內容複製覆蓋回根目錄，再 commit / push。 |

## 工作流程

1. 之後要改頁面內容，一律在**編號最大的那個 `Vn/`**（目前是 `V1/`）動手，不要直接改根目錄。
2. **不用手動記得同步**：`.git/hooks/pre-commit` 已設定成每次 `git commit` 前自動找出編號最大的 `Vn/`，把裡面的 `README.md`／`index.html` 複製覆蓋根目錄並 `git add` 進這次 commit，確保根目錄（＝線上發布版本）永遠等於最新版本。正常流程只要：
   ```
   git commit -m "..."
   git push
   ```
   想手動先看一次同步結果，也可以自己跑 `sh sync-latest.sh`（跟 hook 用同一套邏輯，差別是它不會自動 `git add`）。
   ⚠️ `.git/hooks/` 不會被 git 追蹤、不會隨 push／clone 帶到其他機器，是**本機專屬**設定；換一台電腦要重新複製這個 hook。
3. 若要再開下一個版本快照，把當時最新的 `Vn/` 整份複製一份改名為 `V(n+1)/`，繼續在新資料夾上修改，以此類推（舊的 `Vn/` 保留不動，作為歷史對照）。hook 與 `sync-latest.sh` 都會自動抓編號最大的那個，不用手動改腳本或 hook。

## 目前最新版本

**`V1/`**（2026-08-14 建立，內容與 `V0/` 及根目錄一致，尚未有任何修改）。

## 為什麼不直接搬移根目錄檔案

`index.html` 是透過 GitHub Pages 從 repo 根目錄直接發布上線（見 `README.md`：「push 到 `main` 就上線」）。若把根目錄檔案整個搬進 `V0/`，根目錄會暫時沒有 `index.html`，線上頁面會 404。因此改採「根目錄保留一份與 `V1/` 同步的副本」，而不是把檔案移出根目錄。

## 紀錄

> 格式：`- YYYY-MM-DD HH:MM（裝置：<裝置ID>）：內容`。MEDTECS 專案資料夾（`C:\flaskspace\Claude\MEDTECS` 全域）下的變更紀錄一律比照此格式，附裝置 ID 與時間戳記。

- 2026-08-14 01:53（裝置：MT-N112）：建立 `V0/`（基準快照，內容取自當時根目錄）與 `V1/`（工作副本，複製自 `V0/`）。根目錄檔案未搬動，維持線上版本（https://micl-legal.github.io/4a-devin-demo/）。同時建立 `sync-latest.sh`。此變更目前僅存在於本機工作樹，尚未 commit。
- 2026-08-14 01:55（裝置：MT-N112）：加上 `.git/hooks/pre-commit`，讓「根目錄＝最新版本」這件事每次 commit 前自動同步，不必手動記得跑 `sync-latest.sh`。此 hook 屬本機設定，不會進 git 歷史、不會隨 clone 帶走。
- 2026-08-14 02:16（裝置：MT-N112）：在 `V1/index.html` 調整左側導覽：新增「0　建立專案資料夾」作為獨立於例子1-5之外的事前準備步驟（不列入「共5個」計數，原本例子3 Step1 的建資料夾內容搬到這裡）；例子3 舊內容「飲料店訂購網頁」搬到例子5（拿掉已搬走的 Step1，原 Step2/3 改編號為 Step1/2）；例子3 新內容改為「報表整合系統」（待補佔位）；例子4 改為「會展掃描系統」，已有實際內容（名片收集 App 手機畫面 prompt）。另建立 `V1/card-scanner-app.html`——會展掃描系統對應的獨立畫面 Demo（紫色系、毛玻璃卡片，首頁三大按鈕 → 假相機 → 表單 → 已儲存，資料為假資料、無資料庫）。根目錄尚未同步，此變更僅在 `V1/`。
- 2026-08-14 02:36（裝置：MT-N112）：資料夾編號改為對齊例子編號——`001-Quote`（例子1）／`002-MPT`（例子2）／`003-Report`（例子3）／`004-Expo`（例子4）／`005-Demo`（例子5，原 `001-Demo`）／`Credential`（不對應特定例子）。「0　建立專案資料夾」改法：不再教手動點滑鼠新增資料夾，改成跟其他例子一樣「一句話交給 Claude Code」，由它在終端機一次把六個資料夾建好（手動 GUI 建法留在備援折疊區）。例子1／2／4 都比照例子5 補上「STEP1 讓 Claude Code 到那個資料夾（cd + 啟動 claude）→ STEP2 貼上一句話」的路徑建置指引，每個複製指令都同步帶入對應的資料夾路徑。根目錄尚未同步，此變更僅在 `V1/`。
- 2026-08-14 02:53（裝置：MT-N112）：依實際使用經驗（不特別 `cd` 切路徑，直接在 prompt 裡講明確路徑，Claude Code 一樣能動作），把例子1／2／4／5 的「STEP1 cd 進資料夾＋啟動 claude → STEP2 貼上一句話」還原成單步驟：「📁資料夾提醒 → 把整段複製，貼給 Claude Code（路徑已內嵌在句子裡）」，跟原始頁面風格一致。「0　建立專案資料夾」（一句話讓 Claude Code 建六個資料夾）維持不變。
- 2026-08-14 03:22（裝置：MT-N112）：例子3「報表整合系統」補上實際內容，改法跟其他例子不同——**第一次貼給 Claude Code 的不是文字，是一張畫面截圖**（`V1/assets/003-finance-hub-reference.png`，使用者提供的 Finance Hub System 記帳表單參考畫面）。新增 `.imgbox` 樣式與「複製圖片」按鈕：用 canvas 把 `<img>` 轉成 PNG blob，透過 `navigator.clipboard.write` + `ClipboardItem` 複製到剪貼簿供 Ctrl+V 貼進 Claude Code；不支援或失敗時 fallback 成文字提示「請在圖片上按右鍵→複製圖片」（原生右鍵複製一定可行）。複製圖片後接一句可複製文字 prompt（帶 `003-Report` 路徑），請 Claude Code 照圖做出對應欄位。注意：canvas 圖片複製在 `file://` 本機預覽時可能因跨源限制被擋（會自動走文字 fallback），部署到 GitHub Pages（https 同源）後應可正常運作於 Chromium 系瀏覽器。同時建立 `V1/assets/` 資料夾存放參考圖檔。
- 2026-08-14 03:33（裝置：MT-N112）：使用者用 `file://` 本機開啟測試「複製圖片」失敗（預期內，本機檔案會被瀏覽器擋剪貼簿寫入）。討論後決定**不改 code**——維持 canvas + `navigator.clipboard.write` 的複製圖片實作，改用部署後的 https 網址（或至少 `localhost` 這種 secure context）測試，而不是直接雙擊本機檔案。嘗試起一個本機 `python -m http.server` 供 `localhost` 測試，但這台機器沒有 `python`／`python3`（只有 `py`），指令失敗（exit 127），尚未起成本機測試伺服器。
- 2026-08-14 04:08（裝置：MT-N112）：已 commit + push 上線（`3129c84`）。push 過程發現 Windows Credential Manager 卡的是個人帳號 `lin0919232728` 憑證，跟 `gh auth switch` 選的 `MICL-Legal` 不同步，第一次 push 被拒；使用者改為把 `lin0919232728` 加成 `MICL-Legal/4a-devin-demo` 的協作者（write 權限，已用 GitHub API 確認），改用這組憑證 push 成功——注意這是刻意例外，`ACCOUNTS.md` 仍把個人帳號標記為「不用於 MEDTECS 工作」，兩者暫時並存。上線後使用者在正式 https 網址測試，「複製圖片」按鈕（canvas + clipboard.write）依然沒反應，右鍵原生「複製圖片」正常。因此在例子3的圖片區塊**新增「下載圖片」按鈕跟複製圖片並排**（真正的 `<a download>` 連結，不經 clipboard API，任何環境都可行），並修正 `.imgbox` 按鈕原本沒套到 `.cmd .copy` 樣式、顯示成陽春按鈕的問題。此變更尚未同步回根目錄／commit。
