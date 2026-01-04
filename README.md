# filesystem-layout

Simple directory layouts for personal use and for organising my work files.

These are the structures I use myself on my personal machines and in work environments.

---

## Layouts

Personal:

```ILES/
├── 00_SYSTEM
├── 01_WORK
├── 02_PROJECTS
├── 03_KNOWLEDGE
├── 04_PERSONAL
├── 05_MEDIA
├── 06_ARCHIVE
└── 99_INBOX
```
Work:
```
WORK/
├── 00_ADMIN
├── 01_PROJECTS
├── 02_MEETINGS
├── 03_REFERENCE
├── 04_DELIVERABLES
├── 99_INBOX
└── ARCHIVE
```
---

## Usage

The idea is to be able to recreate the filesystem structure quickly on any machine.

Linux / macOS:

sh install.sh personal/tree.txt "$HOME/FILES"

Windows:

powershell -ExecutionPolicy Bypass -File install.ps1 -TreeFile .\personal\tree.txt -Dest "$env:USERPROFILE\FILES"

---

## Notes

- `tree.txt` defines the directory structure
- Installers only create folders
- Each layout includes a `filesystem.md` file with versioning and extra details

---

## License

MIT / Public domain
