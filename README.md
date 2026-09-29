# Air Wars 3 (local Unity WebGL)

**SiteLock removed + Martian Photon endpoint restored**

- CrazyGames SiteLock neutralized so the game loads off crazygames.com.
- `getPhotonAppIDregion.php` is intercepted and returns the live Martian response
  (same body the official servers return).
- Works from GitHub Pages / local static hosting.

## After cloning (required once)

The data file is split for GitHub’s 100MB file limit. Reassemble it:

**Linux / macOS / Git Bash:**
```bash
cd Build
chmod +x join-data.sh
./join-data.sh
```

**Windows:**
```cmd
cd Build
join-data.bat
```

You should get `Build/AirWars3-158.data.unityweb` (~101 MB).

## Run

```bash
npx serve .
# or: python3 -m http.server 8080
```

Open the URL shown (e.g. http://localhost:3000).

## Layout

```
├── index.html
├── README.md
└── Build/
    ├── UnityLoader.js
    ├── AirWars3-158.json
    ├── AirWars3-158.data.unityweb          ← after join
    ├── AirWars3-158.data.unityweb.part00   ← git
    ├── AirWars3-158.data.unityweb.part01
    ├── AirWars3-158.data.unityweb.part02
    ├── AirWars3-158.wasm.code.unityweb
    ├── AirWars3-158.wasm.framework.unityweb
    ├── join-data.sh
    └── join-data.bat
```

## GitHub

Do **not** commit the reassembled `AirWars3-158.data.unityweb` (101MB).  
Commit only the `.part00` / `.part01` / `.part02` files (each ≤ 40MB).

