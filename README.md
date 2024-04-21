# Solutions for Ticketing System Toil

## Overview

This document outlines potential solutions to reduce the toil associated with the ticketing system at UpCommerce. The focus is on addressing recurring obsolete alerts and enhancing prioritization of issues.

## Solutions

### 1. **PagerDuty**
- **Description**: PagerDuty is an incident management platform that offers reliable alerting, on-call scheduling, automatic escalations, and incident tracking aimed to increase the efficiency of IT operations.
- **Key Features**:
  - Intelligent alert grouping to reduce noise.
  - Automation of incident response to prioritize critical alerts.
  - Integration capabilities with monitoring tools to provide context-rich alerts.
- **Website**: [PagerDuty](https://www.pagerduty.com)

### 2. **Zabbix**
- **Description**: Zabbix is an open-source monitoring solution capable of handling multiple components of an IT infrastructure, including applications, servers, and network devices.
- **Key Features**:
  - Proactive monitoring for performance and availability.
  - Automatic problem detection and alerting system.
  - Problem resolution workflows to manage alerts efficiently.
- **Website**: [Zabbix](https://www.zabbix.com)

### 3. **Prometheus + Alertmanager**
- **Description**: Prometheus is an open-source systems monitoring and alerting toolkit originally built at SoundCloud. Alertmanager handles alerts sent by Prometheus servers and ensures that the right people are notified.
- **Key Features**:
  - Flexible query language to leverage data collection.
  - Alert batching to minimize notification noise.
  - Routing of alerts based on severity and time-based patterns.
- **Website**: [Prometheus](https://prometheus.io)
