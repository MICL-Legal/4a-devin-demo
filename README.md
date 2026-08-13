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
| 1 | 業務報價系統（隔離衣 Level 4） | ✅ 已上 prompt |
| 2 | 一句話影片機（MoneyPrinterTurbo） | ✅ 已上 prompt |
| 3 | 飲料店訂購網頁 | ✅ 已上 prompt |
| 4 | （待補） | ⏳ 佔位中 |
| 5 | （待補） | ⏳ 佔位中 |

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

⚠️ `<pre>` 裡的內容是**逐字照抄**，包含空白與換行。`<pre>` 開標籤後**不要換行**、後續每行要**頂到最左邊**，否則多出來的縮排會被一起複製走。

複製鈕不需要另外設定，JS 會自動抓同一個 `.cmd` 裡的 `<pre>` 內容。

## 檔案

- `index.html` — 全部內容（單一檔案，含 CSS 與 JS）
- `README.md` — 這份說明

## 原則

- **prompt 一字不改**：學員複製到的必須跟現場示範的完全一樣（含原本的半形逗號與筆誤）。
- **不放任何機密**：這是公開 repo，不放金鑰、工號、內網位址、個資。
