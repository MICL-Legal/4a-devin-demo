# 4a-devin-demo

2026 4A AI 工作坊 · **8/14 Devin 場**的學員頁：〈魔法的世界「一句話→完成」· 5 個例子〉。

線上位置：<https://micl-legal.github.io/4a-devin-demo/>

配套頁（會前會裝機精靈，另一個 repo）：<https://micl-legal.github.io/4a-sgx-demo/setup.html>

---

## 這頁在做什麼

Devin 場 2-1 的 5 個開場案例，每一個都附上**現場真正貼進去的那一句 prompt**，學員按「複製整段」就能直接貼進 Claude Code 自己跑一次。

視覺與互動沿用 `4a-sgx-demo/setup.html` 的同一套設計（同配色變數、左側步驟軌、進度條、深色複製框、深淺色自動切換），所以兩頁並排看是同一個系統。

## 目前狀態

| 例子 | 內容 | 狀態 |
|---|---|---|
| 1 | 業務報價系統（隔離衣 Level 4） | 已上 prompt |
| 2 | 一句話影片機（MoneyPrinterTurbo） | 已上 prompt |
| 3 | 飲料店訂購網頁 | **全員實作版**：Step 1 建資料夾／Step 2 進資料夾啟動／Step 3 貼 prompt |
| 4 | （待補） | 佔位中 |
| 5 | （待補） | 佔位中 |

## 例子 3 的工作資料夾（全工作坊共用）

```
C:\AI-Workspace\Claude\Project\
  001-Demo\          ← 飲料店 Demo
  002-MPT\           ← MoneyPrinterTurbo（例子 2）
  003-notebooklm\    ← NotebookLM
  Credential\        ← 金鑰
```

設計決定，改之前先看懂：

- **學員手動建**（右鍵 → 新增 → 資料夾）。頁面**不提供**一鍵建立指令——這是刻意的教學決定，不是漏做。頁面只給四個名稱的複製鈕，避免中文輸入法打出全形字。
- **走到 C 槽用 `Win`+`R` 貼 `C:\`**，不教「點左邊本機」。原因：Win10／Win11／有沒有被 OneDrive 接管，左欄長得都不一樣，貼路徑才是每台電腦都一致的動作。備援（公司政策鎖掉「執行」）收在折疊區。
- **同一個機制用兩次**：開資料夾用 `Win`+`R`，Step 1 最後的驗收也用 `Win`+`R` 貼 `C:\AI-Workspace\Claude\Project`。學一次、用兩次。
- **Step 2 不能省。** Claude Code 只認得你啟動它的目錄，所以要先 `cd` 到 `001-Demo` 再打 `claude`，否則給它別處的絕對路徑會多一道授權或直接不動。
- **大小寫**：頁面上資料夾一律寫 `001-Demo`，prompt 裡是 `001-DEMO`。Step 3 有一則說明告訴學員 Windows 不分大小寫、是同一個資料夾。**不得為了統一大小寫去改 prompt。**

待補：Windows 實機截圖三張（Win+R 的「執行」視窗／右鍵新增資料夾的選單／Project 裡四個資料夾），放進 repo 後用 `<img>` 嵌進 Step 1，做法同 `4a-sgx-demo/setup.html` 的 `setup-email-sample.png`。維護這份 repo 的機器是 macOS，截圖需由 Windows 端提供。

## 怎麼補例子 4／5

`index.html` 是**單檔、零依賴、零建置**——直接改 HTML，push 到 `main` 就上線（約 1 分鐘）。

把 `data-t`／`data-d`（左側軌顯示的標題與副標）填掉，並把 `soon` 那一版的區塊換成有 prompt 的版本：

```html
<section class="panel case" data-t="標題" data-d="左側軌的一行說明">
  <div class="stepno">例子 4　·　共 5 個</div>
  <h2>標題</h2>
  <p class="sub">副標</p>
  <div class="why">為什麼這個例子值得看。</div>
  <p class="do">把整段複製，貼給 Claude Code：</p>
  <div class="cmd"><div class="top"><span class="t">現場用的那一句話</span><button class="copy">複製整段</button></div><pre>第一行 prompt
第二行 prompt</pre></div>
  <div class="ok"><span class="c">✓ 成功長這樣</span><span>怎樣算成功。</span></div>
</section>
```

要做成像例子 3 那種多步驟實作版：用 `<div class="stephd"><span class="n">STEP 1</span>標題<span class="sfx">補充</span></div>` 起一段，步驟內文用 `<p class="hand">`，名稱複製鈕用 `<button class="chip" data-copy="名稱"><b>名稱</b><span>複製</span></button>`。

⚠️ `<pre>` 裡的內容是**逐字照抄**，包含空白與換行。`<pre>` 開標籤後**不要換行**、後續每行要**頂到最左邊**，否則多出來的縮排會被一起複製走。

複製鈕不需要另外設定：JS 會自動抓同一個 `.cmd` 裡的 `<pre>` 內容；chip 會抓自己的 `data-copy`。

## 檔案

- `index.html` — 全部內容（單一檔案，含 CSS 與 JS）
- `README.md` — 這份說明

## 原則

- **prompt 一字不改**：學員複製到的必須跟現場示範的完全一樣（含原本的半形逗號與筆誤）。
- **複製鈕不准謊報**：只有真的寫進剪貼簿才顯示「已複製」，失敗時改為選取內容並提示按 Ctrl+C。
- **不放任何機密**：這是公開 repo，不放金鑰、工號、內網位址、個資。
