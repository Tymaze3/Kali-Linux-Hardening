# 🧱 Kali-Linux-Hardening

🔐 This project is a custom hardening script and checklist for Kali Linux in a homelab environment.  
The goal is to lock down a Kali VM while preserving functionality for ethical hacking and learning.

---

## 🎯 Objectives

- Secure default system configuration
- Reduce attack surface for homelab testing
- Enforce basic Linux security best practices
- Practice scripting with Bash and security automation

---

## 🛠️ Hardening Tasks (Planned & Implemented)

- [ ] Enable UFW firewall with default-deny rules
- [ ] Disable root SSH login
- [ ] Configure strong password and lockout policies
- [ ] Harden file permissions
- [ ] Disable and remove unused services
- [ ] Enable logging and auditing (rsyslog, auditd)
- [ ] Set automatic updates or manual patch reminders
- [ ] Bash history & environment cleanup
- [ ] CIS/STIG cross-checking

---

## 📂 Repo Layout

Kali-Linux-Hardening/
├── hardening-script.sh        # The main Bash script
├── Before-After.md            # System state comparison
├── References.md              # Links to benchmarks and guides
└── README.md

## ⚙️ How to Use

```bash
chmod +x hardening-script.sh
sudo ./hardening-script.sh

