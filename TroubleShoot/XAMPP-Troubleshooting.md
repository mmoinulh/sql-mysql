# XAMPP MySQL and Windows PC Troubleshooting Summary

## 1. System Cleanup & Diagnostics
* **Disk Cleanup (`cleanmgr`)**: Used to clear temporary files and system clutter to free up space.
* **Network & Cache Reset**: Utilities like `ipconfig /flushdns` and `wsreset.exe` clear system resolver and app store caches.

## 2. Firewall & Port Management
* **Firewall Reset**: `netsh advfirewall reset` restores Windows Firewall to default state.
* **Process Termination**: Identifying port conflicts via `netstat -ano | findstr :PORT` and killing the blocking application using `taskkill /PID <PID> /F`.

## 3. XAMPP MySQL Troubleshooting
Resolution steps for the error `"MySQL shutdown unexpectedly"`:
* **Fixing File Corruption (Recommended)**: Removing corrupted `ib_logfile0` and `ib_logfile1` tracking files from `xampp/mysql/data/`.
```
* ibdata1 (Note: Only delete this if deleting the logfiles alone doesn't work; if you delete it, you may need to restore databases from the backup folder).
```
* **Resolving Port Conflict (3306)**: Modifying `my.ini` to run MySQL on a secondary port (e.g., `3307`) or killing competing processes occupying port 3306.
