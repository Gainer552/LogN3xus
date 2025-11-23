                     LogN3xus
        Unified System Log Aggregation & Monitoring

LogN3xus is a command-line driven log 
collector designed to aggregate multiple system logs, 
network data, kernel information, and user activity logs 
into a single, organized, and timestamped report.

This tool is intended for system administrators, 
security analysts, and digital forensics practitioners 
who need a fast, comprehensive snapshot of system 
activity.

Overview

LogN3xus collects, displays, and stores data from:

 • Auditd logs.
 • Syslog/messages
 • Firewall logs (UFW).
 • Network connection information (ss, netstat).
 • Web server logs (NGINX).
 • Cron logs.
 • Kernel ring buffer (dmesg).
 • Loaded kernel modules (lsmod).
 • Kernel symbol table (kallsyms).
 • User shell history (~/.bash_history).

All output is displayed with color-coded formatting and 
saved into a timestamped .txt file for later review.

Example output file:
system_logs_2025-11-23_14-21.txt



Features

 • Color-coded on-screen display for readability.
 • Automated aggregation into a single report file.
 • Timestamped and labeled log sections.
 • Minimal dependencies (bash + standard utilities).
 • Supports sudo/privileged commands when needed.
 • Works on most Linux distributions (Debian, Ubuntu,
   Fedora, Arch, RHEL).


Installation

1. Place the script anywhere you prefer: ~/LogN3xus/logn3xus.sh

2. Make it executable: chmod +x logn3xus.sh

3. Ensure you have necessary privileges for system logs. Some sections require sudo access.


Usage

Run the script: ./logn3xus.sh

For systems requiring sudo: sudo ./logn3xus.sh

After execution, LogN3xus will:

 • Display each category of logs on screen with color.
 • Create a timestamped .txt file in the current directory.
 • Organize all logs into labeled, searchable sections.

Output Format

Each section in the exported .txt file is wrapped in:

==============================
SECTION NAME
==============================

This ensures quick navigation when reviewing large files.

Example sections include:

 • AUDITD LOGS
 • SYSTEM LOGS
 • FIREWALL LOGS
 • NETWORK CONNECTIONS
 • WEB SERVER LOGS
 • DMESG OUTPUT
 • KERNEL MODULES
 • USER SHELL HISTORY


Customization

You may edit logn3xus.sh to:

 • Add/remove log sources.
 • Change color schemes.
 • Modify file output location.
 • Add filtering (error-only, timeframe-based, etc.)
 • Redirect logs into a .tar.gz archive.
 • Integrate with cron or automated monitoring tools.

Project Structure

LogN3xus/
 ├── logn3xus.sh      (Main script)
 ├── README.txt       (Documentation)
 ├── logs/            (Optional storage directory)
 └── archive/         (Optional compressed output)

DISCLAIMER

LogN3xus is provided as-is for educational and 
administrative purposes only.

The authors and contributors are NOT responsible for:

 • Misuse of this script on systems where you do not have proper authorization.
 • Data loss caused by improper execution or modification.
 • Violations of privacy, security policies, or laws.

You are solely responsible for ensuring that the use of 
this script complies with all applicable legal and ethical 
requirements. Use only on systems you own or are 
explicitly authorized to assess.

By using LogN3xus, you acknowledge and accept this 
disclaimer.