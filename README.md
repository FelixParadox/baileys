🚀 @suneo/baileys

WhatsApp Baileys - Library WhatsApp Automation dengan Pairing Stabil & Fitur Lengkap

<p align="center">
  <img src="https://uploader.merllerm.tech/permadrop/7933-107-1jun2026.jpg" alt="Thumbnail" width="800" />
</p>

<p align="center">
  <a href="https://www.npmjs.com/package/@suneo/baileys">
    <img src="https://img.shields.io/npm/v/@suneo/baileys.svg?style=for-the-badge&color=25D366" alt="npm version" />
  </a>
  <a href="https://nodejs.org">
    <img src="https://img.shields.io/badge/Node.js-20%2B-339933?style=for-the-badge&logo=node.js&logoColor=white" alt="Node.js" />
  </a>
  <a href="https://opensource.org/licenses/MIT">
    <img src="https://img.shields.io/badge/License-MIT-yellow?style=for-the-badge" alt="License" />
  </a>
  <a href="https://whatsapp.com/channel/0029VazMIDf5a24D7Tjiaw04">
    <img src="https://img.shields.io/badge/Channel-WhatsApp-25D366?style=for-the-badge&logo=whatsapp&logoColor=white" alt="WhatsApp Channel" />
  </a>
</p>

---

📖 Tentang Baileys

@suneo/baileys adalah library open-source untuk membangun solusi otomatisasi dan integrasi dengan WhatsApp secara efisien dan langsung. Menggunakan teknologi WebSocket tanpa memerlukan browser, library ini mendukung berbagai fitur seperti:

· Manajemen pesan
· Penanganan chat
· Administrasi grup
· Pesan interaktif & tombol aksi
· Custom pairing yang stabil

Fokus Utama: Meningkatkan proses pairing dan autentikasi agar lebih stabil, aman, dan dapat dikustomisasi dengan kode sendiri.

---

✨ Fitur Unggulan

Fitur Deskripsi
🔐 Pairing Stabil Proses pairing otomatis & custom yang handal
🛠️ Custom Pairing Pairing dengan kode sendiri, lebih aman
💬 Pesan Interaktif Tombol, menu, dan pesan dinamis
📱 Multi-Device Kompatibel dengan fitur multi-device terbaru
🔄 Session Management Manajemen session otomatis & efisien
📦 Ringan & Modular Mudah diintegrasikan ke berbagai sistem
📚 Dokumentasi Lengkap Contoh kode siap pakai
🎯 Stabil & Cepat Performa tinggi untuk produksi

---

🚀 Instalasi

NPM

```bash
npm install @suneo/baileys
```

Yarn

```bash
yarn add @suneo/baileys
```

PNPM

```bash
pnpm add @suneo/baileys
```

---

🎯 Memulai

Basic Setup

```javascript
import makeWASocket from '@suneo/baileys';
import { useMultiFileAuthState } from '@suneo/baileys';

async function startBot() {
  const { state, saveCreds } = await useMultiFileAuthState('./session');
  
  const sock = makeWASocket({
    auth: state,
    printQRInTerminal: true,
    // Custom pairing code
    pairingCode: '123456'
  });

  sock.ev.on('creds.update', saveCreds);

  sock.ev.on('messages.upsert', async (m) => {
    const msg = m.messages[0];
    if (!msg.key.fromMe && msg.message) {
      console.log('📩 Pesan masuk:', msg);
      
      // Reply otomatis
      await sock.sendMessage(msg.key.remoteJid, {
        text: 'Halo! Saya bot WhatsApp 👋'
      });
    }
  });

  console.log('✅ Bot siap!');
}

startBot();
```

---

📚 Fitur Lengkap

1. 📋 Label Group

Tag/Label member grup dengan mudah:

```javascript
await sock.setLabelGroup(jid, string);
```

2. 🔍 Check ID Channel

Dapatkan ID channel dari URL:

```javascript
const result = await sock.newsletterFromUrl(url);
// Result:
// {
//   "name": "Name Channel",
//   "id": "Channel ID",
//   "state": "Status Channel",
//   "subscribers": "Followers",
//   "verification": "UNVERIFIED",
//   "creation_time": 1728547155,
//   "description": "Description Channel"
// }
```

3. 🚫 Check Banned Number

Cek status nomor yang diblokir:

```javascript
await sock.checkWhatsApp(jid);
```

---

💬 SendMessage Documentation

📤 Status Mention Group & Private

Kirim status mention di grup/private chat:

```javascript
await sock.sendStatusMention(content, jid);
```

📤 Status Group Message V2

Kirim status grup versi 2:

```javascript
await sock.sendMessage(jid, {
  groupStatusMessage: {
    text: "Hello World"
  }
});
```

🖼️ Album Message (Multiple Images)

Kirim multiple gambar dalam satu album:

```javascript
await sock.sendMessage(jid, {
  albumMessage: [
    { image: imageBuffer1, caption: "Foto pertama" },
    { image: { url: "URL_IMAGE" }, caption: "Foto kedua" }
  ]
}, { quoted: m });
```

🎉 Event Message

Buat undangan event WhatsApp:

```javascript
await sock.sendMessage(jid, {
  eventMessage: {
    isCanceled: false,
    name: "Hello World",
    description: "Deskripsi event",
    location: {
      degreesLatitude: 0,
      degreesLongitude: 0,
      name: "Lokasi Event"
    },
    joinLink: "https://call.whatsapp.com/video/merlinus",
    startTime: "1763019000",
    endTime: "1763026200",
    extraGuestsAllowed: false
  }
}, { quoted: m });
```

📊 Poll Result Message

Tampilkan hasil polling:

```javascript
await sock.sendMessage(jid, {
  pollResultMessage: {
    name: "Hello World",
    pollVotes: [
      { optionName: "TEST 1", optionVoteCount: "112233" },
      { optionName: "TEST 2", optionVoteCount: "1" }
    ]
  }
}, { quoted: m });
```

🎯 Interactive Message (Simple)

Kirim pesan interaktif dengan tombol copy:

```javascript
await sock.sendMessage(jid, {
  interactiveMessage: {
    header: "Hello World",
    title: "Hello World",
    footer: "telegram: @merlinussss",
    buttons: [{
      name: "cta_copy",
      buttonParamsJson: JSON.stringify({
        display_text: "copy code",
        id: "123456789",
        copy_code: "ABC123XYZ"
      })
    }]
  }
}, { quoted: m });
```

🎯 Interactive Message with Native Flow

Pesan interaktif dengan native flow:

```javascript
await sock.sendMessage(jid, {
  interactiveMessage: {
    header: "Hello World",
    title: "Hello World",
    footer: "telegram: @merlinussss",
    image: { url: "https://example.com/image.jpg" },
    nativeFlowMessage: {
      messageParamsJson: JSON.stringify({
        limited_time_offer: {
          text: "idk hummmm?",
          url: "https://t.me/merlinussss",
          copy_code: "z4phdev",
          expiration_time: Date.now() * 999
        },
        bottom_sheet: {
          in_thread_buttons_limit: 2,
          divider_indices: [1, 2, 3, 4, 5, 999],
          list_title: "z4phdev",
          button_title: "z4phdev"
        }
      }),
      buttons: [{
        name: "cta_copy",
        buttonParamsJson: JSON.stringify({
          display_text: "copy code",
          id: "123456789",
          copy_code: "ABC123XYZ"
        })
      }]
    }
  }
}, { quoted: m });
```

🛍️ Product Message

Kirim pesan produk catalog:

```javascript
await sock.sendMessage(jid, {
  productMessage: {
    title: "Produk Contoh",
    description: "Ini adalah deskripsi produk",
    thumbnail: { url: "https://example.com/image.jpg" },
    productId: "PROD001",
    retailerId: "RETAIL001",
    url: "https://example.com/product",
    body: "Detail produk",
    footer: "Harga spesial",
    priceAmount1000: 50000,
    currencyCode: "USD",
    buttons: [{
      name: "cta_url",
      buttonParamsJson: JSON.stringify({
        display_text: "Beli Sekarang",
        url: "https://example.com/buy"
      })
    }]
  }
}, { quoted: m });
```

📄 Interactive Message with Document

Kirim pesan interaktif dengan dokumen (buffer):

```javascript
await sock.sendMessage(jid, {
  interactiveMessage: {
    header: "Hello World",
    title: "Hello World",
    footer: "telegram: @merlinussss",
    document: fs.readFileSync("./document.pdf"),
    mimetype: "application/pdf",
    fileName: "document.pdf",
    jpegThumbnail: fs.readFileSync("./thumbnail.jpeg"),
    buttons: [{
      name: "cta_url",
      buttonParamsJson: JSON.stringify({
        display_text: "Telegram",
        url: "https://t.me/kaitlynid"
      })
    }]
  }
}, { quoted: m });
```

💳 Request Payment Message

Kirim permintaan pembayaran:

```javascript
await sock.sendMessage(jid, {
  requestPaymentMessage: {
    currency: "IDR",
    amount: 10000000,
    from: m.sender,
    sticker: JSON.parse(quotedContent),
    background: {
      id: "100",
      fileLength: "0",
      width: 1000,
      height: 1000,
      mimetype: "image/webp",
      placeholderArgb: 0xFF00FFFF,
      textArgb: 0xFFFFFFFF,
      subtextArgb: 0xFFAA00FF
    }
  }
}, { quoted: m });
```

---

🤝 Mengapa Memilih @suneo/baileys?

Keunggulan Deskripsi
🔐 Pairing Stabil Proses pairing yang handal & anti-gagal
🛠️ Custom Pairing Kode pairing dapat dikustomisasi
💬 Fitur Lengkap Mendukung semua fitur WhatsApp terbaru
⚡ Performa Tinggi Ringan, cepat, dan efisien
📱 Multi-Device Dukungan penuh multi-device
🔄 Session Auto Manajemen session otomatis
📚 Dokumentasi Lengkap dengan contoh kode
🎯 Produksi Ready Stabil untuk skala bisnis

---

📱 Channel & Komunitas

Ikuti perkembangan terbaru melalui channel resmi:

· WhatsApp Channel: Channel WhatsApp
· Telegram: Telegram Contact

---

👥 Kontributor

Terima kasih kepada para kontributor yang telah membantu mengembangkan project ini 💖

<table>
  <tr>
    <td align="center">
      <a href="https://github.com/FelixParadox">
        <img src="https://github.com/FelixParadox.png" width="100px;" style="border-radius:50%;" alt="Felix Paradox"/>
        <br />
        <sub><b>Felix Paradox</b></sub>
        <br />
        <sub>👑 Owner & Maintainer</sub>
      </a>
    </td>
  </tr>
</table>

---

📝 Lisensi

MIT © Felix Paradox

---

⭐ Dukungan

Jika Anda menyukai project ini, berikan ⭐ di GitHub dan bagikan ke teman-teman!

<p align="center">
  <b>Dibuat dengan ❤️ untuk komunitas WhatsApp automation</b>
</p>