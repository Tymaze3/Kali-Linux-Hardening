# 🔍 Before-After: Kali Linux Hardening

This document tracks baseline system values before and after applying `hardening-script.sh`.

---

## ✅ System Changes Summary

| Area                  | Before                         | After                              |
|-----------------------|--------------------------------|-------------------------------------|
| UFW Status            | Inactive                       | Active, default deny incoming       |
| Root SSH Login        | Enabled                        | Disabled                            |
| Password Min Length   | Default (6)                    | Enforced (14) via `/etc/login.defs` |
| Account Lockout       | Not enforced                   | 5 failed attempts, 15 min lockout   |
| Home Dir Permissions  | 755                            | 700                                 |
| Bluetooth/CUPS/Avahi  | Enabled or Active              | Disabled                            |

---

## 🧪 How to Check After Hardening

```bash
# Check UFW
sudo ufw status verbose

# Check SSH root login
grep "PermitRootLogin" /etc/ssh/sshd_config

# Check password policy
grep "PASS_MIN_LEN" /etc/login.defs

# Check home permissions
ls -ld /home/$USER

# Check if services are active
systemctl is-enabled bluetooth
