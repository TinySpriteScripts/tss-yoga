# |‾‾‾|/‾‾‾\ /‾‾‾\
#   |  \__‾‾\\__‾‾\
#   |   |___/ |___/
# tinysprite.dev
#
# [`tss-yoga`] by [TinySprite Scripts (TSS)](https://tinysprite.dev/) | [Discord](https://discord.gg/ZMFfC54FdJ) | [Support Us](https://ko-fi.com/tinysprite)

This script is to allow citizens of your city to find peace and relax in the city of Los Santos by finding their Zen while excercising in Yoga.
Citizens of your city will be able to interact with yoga mats placed around the city to destress before going about their busy daily lives.

---

## 🔧 Support
Need help with setup or encountering issues? Join our Discord: [Join Support Server](https://discord.gg/ZMFfC54FdJ)

---

## 🧰 Installation

> **This script requires [`tss_bridge`](https://github.com/TinySpriteScripts/tss_bridge).** It must be installed and started **before** `tss-yoga`.

1. Install `tss_bridge` and make sure it is ensured before `[tinysprite]` in your `server.cfg`
2. Create a folder called `[tinysprite]` in your server resources directory (if not already existing)
3. Place the `tss-yoga` resource in that subfolder
4. Ensure it is started in your `server.cfg`:
   ```cfg
   ensure [standalone]  -- place tss_bridge here
   ensure [tinysprite]
   ```

---

## 📦 Dependencies
- [tss_bridge](https://github.com/TinySpriteScripts/tss_bridge) (**required**) - handles framework, target, notify, progressbar, blips and props

---

## ✨ Features
 - Provides your city with a way to release stress
   + Set your stress release anywhere from 1-100 in the config
 - Config Adjustments
   + Progressbar timer (set long by default to stop abuse)
   + Target, notify and progressbar providers selectable through `Config.TSS` (or follow `tss_bridge`)
   + Adjustable Yoga animation in the config
   + Set your yogamat locations, as many as you want
   + Set your Yoga Locations names and blips
 - 3 Yoga Mats are set by the main Courthouse by default

---

## ⚠️ Disclaimer

- This script is fully open source; all files are open and editable.

---

## 📬 Contact

- Tebex: [Our Store](https://tinysprite.dev/)
- Discord: [Our Discord](https://discord.gg/ZMFfC54FdJ)
- Ko-fi: [https://ko-fi.com/tinysprite](https://ko-fi.com/tinysprite)

---

**© TinySprite** — Quality resources built for FiveM servers.
