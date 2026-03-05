# VM Health Check

## Overview
This VM Health Check script is designed to monitor and assess the operational state of virtual machines (VMs). It helps in identifying potential issues, ensuring optimal performance, and providing insights into resource utilization.

## Features
- **CPU Monitoring**: Continuously check CPU usage and identify any spikes or usage anomalies.
- **Memory Usage**: Monitor memory consumption and alert on thresholds.
- **Disk Space Management**: Check available disk space and warn if it falls below acceptable levels.
- **Service Status Monitoring**: Assess the status of essential services running on the VM.
- **Log Analysis**: Review log files for errors or warnings.

## Installation
1. **Clone the repository**:
   ```bash
   git clone https://github.com/amatncs/vm-health-check.git
   cd vm-health-check
   ```
2. **Install dependencies** (if any):
   ```bash
   # Assume a typical package manager is used like pip or npm
   pip install -r requirements.txt
   ```

## Usage
1. **Make the script executable**:
   ```bash
   chmod +x vm_health_check.sh
   ```
2. **Run the script**:
   ```bash
   ./vm_health_check.sh
   ```

## Thresholds
| Metric       | Warning Threshold | Critical Threshold |
|--------------|-------------------|---------------------|
| CPU Usage    | 70%               | 90%                 |
| Memory Usage  | 75%               | 90%                 |
| Disk Space   | 20% free          | 10% free            |

## Exit Codes
- **0**: Everything is OK.
- **1**: Warnings detected; monitor the situation.
- **2**: Critical performance issues identified.
- **3**: Script execution error.

## Troubleshooting Guide
- **High CPU Usage**:
  - Check running processes with `top` or `htop`.
  - Identify if a specific service is consuming resources.
- **Low Disk Space**:
  - Use `df -h` to review disk usage.
  - Consider cleaning up old files or expanding disk size.
- **Service Failures**:
  - Review service logs for errors.
  - Restart services as necessary.

## Automation Examples
- **Cron Job**: Schedule the health check script to run every hour.
   ```bash
   0 * * * * /path/to/vm_health_check.sh >> /var/log/vm_health_check.log 2>&1
   ```
- **Integration with Monitoring Tools**: Integrate with tools like Grafana or Prometheus for visual monitoring and alerting.

## Conclusion
Regular health checks of VMs can prevent potential downtimes and enhance overall system performance. Utilize this script as part of your VM management strategy to ensure optimal operation and timely responses to issues.