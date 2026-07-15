# WSL VHDX Complete Backup & Restore Guide

This document covers the complete process for backing up and restoring your WSL Linux environment using native Virtual Hard Disk (`.vhdx`) formats. Both methods fully preserve your usernames, file permissions, dotfiles, and Docker configurations.

**Requirement:** Run all commands from a Windows PowerShell window opened as **Administrator** (not inside the Linux terminal).

---

## Method 1: The Raw File Copy (`ext4.vhdx`)

Use this method to manually copy the raw virtual disk file. It is the fastest way to back up and allows for a rapid restore.

### Phase 1: The Backup

1. **Shut down WSL:** Completely stop all Linux processes to prevent data corruption:

```powershell
    wsl --shutdown
```

2. **Locate the `ext4.vhdx` file:**
    Depending on your installation, the file will be in one of these two locations:

    * **Modern/Default Path:** Check this directory first:
      `C:\\Users\\<Your_Windows_Username>\\AppData\\Local\\wsl\\`
      *(Look inside the folder with the unique ID, e.g., `{e60484cd-2566-43a1-baed-efd377f65476}`)*

    * **Legacy/Store Path:** If not found above, check here:
      `C:\\Users\\<Your_Windows_Username>\\AppData\\Local\\Packages\\`
      *(Look for a folder named `CanonicalGroupLimited.Ubuntu...` or similar, then open the `LocalState` directory)*

    * **Quick Find Tip:** If you cannot find it, run this command in PowerShell to see exactly where your distribution is stored:
      ```powershell
      Get-ChildItem -Path HKCU:\\Software\Microsoft\\Windows\\CurrentVersion\\Lxss -Recurse | Get-ItemProperty | Select-Object DistributionName, BasePath
      ```

3. **Copy the file:** Copy `ext4.vhdx` and paste it into your safe backup directory (e.g., `D:\\Backups\\WSL\\ext4.vhdx`).

---

### Phase 2: The Restore

1. **Initialize the WSL platform:** If you are restoring to a fresh system, ensure WSL is ready:
    ```powershell
    wsl --install --no-distribution
    ```

2. **Import the file:** Use the `import-in-place` command to register the drive exactly where it sits on your backup storage:
    ```powershell
    wsl --import-in-place Ubuntu "D:\\Backups\\WSL\\ext4.vhdx"
    ```

---

## Important Warnings
* **Safety First:** Never copy or move the `ext4.vhdx` file while WSL is running. Always use `wsl --shutdown` first to ensure the virtual disk is in a "clean" state.
* **Redundancy:** Always keep a second copy of your backup file in a separate location before performing an "import-in-place" restore, as this process may overwrite existing data.

---

## Method 2: The Command-Line Export (`wsl_backup.vhdx`)

Use this method to use the official WSL engine to compile and package your active environment into a dedicated backup archive file.

### Phase 1: The Backup
1. **Shut down WSL** completely to ensure all background processes are stopped:
   ```powershell
   wsl --shutdown
   ```
2. **Identify your exact distribution name**:
   ```powershell
   wsl --list --verbose
   ```
3. **Execute the export command** using the `--format vhd` flag (replace `Ubuntu` with your specific distribution name):
   ```powershell
   wsl --export Ubuntu "D:\Backups\wsl_backup.vhdx" --format vhd
   ```

### Phase 2: The Restore
1. **Initialize the WSL platform** on the system:
   ```powershell
   wsl --install --no-distribution
   ```
2. **Create a permanent destination folder** where you want Windows to store and run the new live virtual hard drive (e.g., `D:\WSL\Ubuntu`).
3. **Run the VHD import command** to unpack your backup archive into that new live working folder:
   ```powershell
   wsl --import Ubuntu "D:\WSL\Ubuntu" "D:\Backups\wsl_backup.vhdx" --vhd
   ```


---
---
---
---

# WSL Audio Optimization Guide for Claude Code & Sounds.sh

This guide sets up, installs, and optimizes terminal sound effects (like [sounds.sh](https://sounds.sh)) inside Windows Subsystem for Linux (WSL) to prevent distorted audio and high latency.

---

## 1. Install Required System Dependencies

Before configuration, you must install the ALSA tools engine, the PulseAudio system bridge, and the media processing utility. Run this single command in your terminal:

```bash
sudo apt update && sudo apt install alsa-utils libasound2-plugins ffmpeg -y
```
* **`alsa-utils`**: Provides the `aplay` core command.
* **`libasound2-plugins`**: Installs the critical system layer that connects ALSA to WSL's native audio server.
* **`ffmpeg`**: Provides the file processing engine to convert audio tracks.

---

## 2. Initialize the ALSA Configuration File

`aplay` cannot talk to raw hardware inside WSL. It must be routed through a high-quality resampling pipeline to the native Windows audio server.

1. Create and open your configuration file:
   ```bash
   nano ~/.asoundrc
   ```
2. Paste this **optimized plug-and-slave configuration** into the editor:
   ```text
   pcm.!default {
       type plug
       slave.pcm "pulse"
   }

   ctl.!default {
       type pulse
   }
   ```
3. Save and close the file (`Ctrl + O`, `Enter`, `Ctrl + X`).

---

## 3. Bulk Convert MP3s to High-Fidelity WAV

`aplay` cannot play compressed `.mp3` files natively (doing so causes loud static and distortion). Run this command inside your sound directory to instantly batch-convert all your assets into high-quality **48kHz, 16-bit uncompressed WAV** files that match your Windows sound card:

```bash
for file in soundsh-*.mp3; do ffmpeg -i "\(file" -ar 48000 -acodec pcm_s16le "\){file%.mp3}.wav"; done
```

### Verify Playback
Test your newly converted files using `aplay`:
```bash
aplay soundsh--aoe2-horn.wav
```

---

## 4. Configure Claude Code Settings

Update your Claude Code configuration hooks to point to the ultra-fast, zero-lag `.wav` files. 

Open your `~/.claude/settings.json` file and map your notification sounds using `aplay`:

```json
{
  "hooks": {
    "Notification": [
      {
        "type": "command",
        "command": "aplay /absolute/path/to/sounds/soundsh--notification.wav"
      }
    ],
    "Stop": [
      {
        "type": "command",
        "command": "aplay /absolute/path/to/sounds/soundsh--aoe2-horn.wav"
      }
    ]
  }
}
```
*Make sure to replace `/absolute/path/to/sounds/` with your actual directory path.*

---

## 5. Troubleshooting & Maintenance

### Fix Crackling/Popping in Windows
If the sound still stutters, Windows is likely handling cache buffers incorrectly.
1. Press `Win + R`, type `mmsys.cpl`, and hit **Enter**.
2. Double-click your active audio device under the **Playback** tab.
3. In the **Advanced** tab, set the dropdown format to `2 channel, 16 bit, 48000 Hz (DVD Quality)`.
4. Turn **Audio Enhancements** and **Spatial Sound** completely **Off**.

### Resetting a Frozen WSL Audio Driver
If your terminal audio hangs or stops producing sound entirely, fully restart the virtual engine from a standard **Windows PowerShell** window:
```powershell
wsl --shutdown
```
Re-opening your WSL terminal will automatically refresh the audio subsystem connection.
