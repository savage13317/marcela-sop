// Generates real PWA icon PNGs (cyan tile + white "M") at all manifest sizes.
// Usage: node tools/gen-icons.js
const zlib = require('zlib');
const fs = require('fs');

function crc32(buf) {
  let c, n = 0;
  const table = [];
  for (let i = 0; i < 256; i++) {
    c = i;
    for (let k = 0; k < 8; k++) c = (c & 1) ? (0xedb88320 ^ (c >>> 1)) : (c >>> 1);
    table[i] = c;
  }
  c = 0xffffffff;
  for (let b of buf) c = table[(c ^ b) & 0xff] ^ (c >>> 8);
  return (c ^ 0xffffffff) >>> 0;
}

function chunk(type, data) {
  const len = Buffer.alloc(4); len.writeUInt32BE(data.length);
  const t = Buffer.from(type, 'ascii');
  const crc = Buffer.alloc(4); crc.writeUInt32BE(crc32(Buffer.concat([t, data])));
  return Buffer.concat([len, t, data, crc]);
}

function makePng(size) {
  // Palette: cyan tile #06b6d4, white M
  const bg = [0x06, 0xb6, 0xd4];
  const fg = [0xff, 0xff, 0xff];
  const raw = Buffer.alloc(size * (size * 3 + 1));
  // M geometry (fractions of size): bars + diagonals
  const barW = size * 0.14;
  const left = size * 0.18, right = size * 0.86 - barW;
  const top = size * 0.22, bottom = size * 0.78;
  const midX = size * 0.5, midY = size * 0.52;
  for (let y = 0; y < size; y++) {
    let row = y * (size * 3 + 1);
    raw[row] = 0; // filter byte
    for (let x = 0; x < size; x++) {
      let on = false;
      if (y >= top && y <= bottom) {
        if ((x >= left && x <= left + barW) || (x >= right && x <= right + barW)) on = true;
        // left diagonal: from (left+barW/2, top) to (midX, midY)
        let t1 = (y - top) / (midY - top);
        if (t1 >= 0 && t1 <= 1) {
          let dx = left + barW / 2 + (midX - left - barW / 2) * t1;
          if (Math.abs(x - dx) <= barW / 2) on = true;
        }
        // right diagonal: from (right+barW/2, top) to (midX, midY)
        if (t1 >= 0 && t1 <= 1) {
          let dx2 = right + barW / 2 + (midX - right - barW / 2) * t1;
          if (Math.abs(x - dx2) <= barW / 2) on = true;
        }
      }
      let o = row + 1 + x * 3;
      const c = on ? fg : bg;
      raw[o] = c[0]; raw[o + 1] = c[1]; raw[o + 2] = c[2];
    }
  }
  const ihdr = Buffer.alloc(13);
  ihdr.writeUInt32BE(size, 0); ihdr.writeUInt32BE(size, 4);
  ihdr[8] = 8; ihdr[9] = 2; // bit depth, color type (RGB)
  return Buffer.concat([
    Buffer.from([0x89, 0x50, 0x4e, 0x47, 0x0d, 0x0a, 0x1a, 0x0a]),
    chunk('IHDR', ihdr),
    chunk('IDAT', zlib.deflateSync(raw)),
    chunk('IEND', Buffer.alloc(0))
  ]);
}

const sizes = [72, 96, 128, 144, 152, 192, 384, 512];
for (const s of sizes) {
  const png = makePng(s);
  const path = 'src/pwa/icon-' + s + 'x' + s + '.png';
  fs.writeFileSync(path, png);
  console.log(path + ' -> ' + png.length + ' bytes');
}
