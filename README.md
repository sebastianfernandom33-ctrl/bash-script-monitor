# Bash Process Monitor Script

This project is a simple Bash script designed to monitor a specific Linux process and automatically restart it if it stops running.

## 📌 Use Case

This script was created to solve a real-world issue where a process responsible for handling notification queues would occasionally stop or consume excessive memory, affecting service reliability.

## ⚙️ Features

* Monitors a specific process
* Automatically restarts the service if it's not running
* Helps maintain system stability
* Can be scheduled using cron for continuous monitoring

## 🛠️ Technologies

* Bash
* Linux (systemctl, pgrep)

## 🚀 How to Use

1. Edit the script and define your process name:

   ```bash
   PROCESS_NAME="your_process"
   ```

2. Give execution permissions:

   ```bash
   chmod +x monitor.sh
   ```

3. Run the script:

   ```bash
   ./monitor.sh
   ```

## 🧠 Author

Built as part of real-world troubleshooting and automation tasks in production environments.
