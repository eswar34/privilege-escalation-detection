# Privilege Escalation Detection After Login Attempts (SOC | Bash)

## 📌 Overview
This project simulates a **Security Operations Center (SOC)** detection scenario
focused on identifying **account compromise followed by privilege escalation**.

Attackers often perform multiple failed login attempts, successfully authenticate,
and then execute privileged commands to expand control.
This script correlates these events to flag suspicious user activity.

---

## 🔍 Detection Use Case
- Detects multiple failed login attempts
- Correlates successful authentication events
- Identifies post-login privilege escalation activity
- Mimics real Tier-2 SOC alert logic

---

---

## 📂 Input File

### `auth.log`
Example format:

Failed password for user1 from 192.168.1.10
Failed password for user1 from 192.168.1.10
Accepted password for user1 from 192.168.1.10
user1 executed sudo command

---

## ⚙️ Detection Logic
1. Extract usernames from authentication events
2. For each user:
   - Count failed login attempts
   - Check for successful login events
   - Check for privileged (sudo) command execution
3. Flag users that meet all conditions:
   - More than one failed login attempt
   - Successful authentication
   - Privilege escalation activity

---

## ▶️ Usage

Make the script executable:
```bash
chmod +x privilege_escalation_detection.sh
Run the script:

./privilege_escalation_detection.sh

🧰 Tools Used

bash

grep

awk

sort

uniq

wc

🛡️ SOC Relevance
This project demonstrates:

Kill-chain correlation

Post-compromise behavior detection

Privilege escalation indicators

Tier-2 SOC analytical skills

Detection engineering fundamentals

🚨 Disclaimer

This project is for educational and defensive security purposes only.
All logs, users, and IP addresses are simulated.
