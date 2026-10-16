const https = require('https');
function get(path) {
  const url = 'https://savage13317.github.io/marcela-sop/' + path;
  return new Promise((res) => {
    const req = https.get(url, { headers: { 'User-Agent': 'marcela-sop-check' } });
    req.on('response', (r) => {
      let len = 0;
      r.on('data', (d) => { len += d.length; });
      r.on('end', () => { res({ path, status: r.statusCode, len }); });
    });
    req.on('error', (e) => { res({ path, status: 0, len: 0 }); });
  });
}
(async () => {
  for (let i = 0; i < 10; i++) {
    const a = await get('MarcelasWebsite.html');
    const b = await get('01_front_office.html');
    console.log('attempt ' + (i + 1) + ': ' + JSON.stringify([a, b]));
    if (a.status === 200 && b.status === 200 && a.len > 1000) {
      console.log('DEPLOYED');
      process.exit(0);
    }
    await new Promise((s) => s());
    await new Promise((s) => setTimeout(s, 30000));
  }
  console.log('NOT YET LIVE');
})();
