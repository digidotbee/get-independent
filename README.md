# Get Independent

> Build a secure, self-hosted communications server on Ubuntu with a single, repeatable installer.

**Get Independent** is an opinionated automation project that transforms a fresh Ubuntu server into a production-ready personal communications server. Its goal is to make it practical for individuals, families, creators, and small organizations to own their infrastructure instead of relying entirely on third-party cloud providers.

This project is inspired by Derek Sivers' philosophy of digital independence, but it is **not** a direct port of his OpenBSD scripts. Instead, it is a ground-up implementation designed specifically for modern Ubuntu LTS releases using Ubuntu-native software and best practices.

---

# Philosophy

The modern internet encourages dependence on platforms that own your data, identity, and communications.

Get Independent takes a different approach.

Your domain.

Your server.

Your email.

Your data.

Your rules.

Rather than assembling dozens of tutorials from across the internet, this project provides a curated, reproducible installation process that follows security best practices while remaining understandable and maintainable.

This repository favors:

* Simplicity over unnecessary complexity
* Security by default
* Idempotent automation
* Open standards
* Minimal external dependencies
* Infrastructure that can be understood by a single person

---

# Goals

When complete, this project will automatically configure a fresh Ubuntu server with:

* Secure email server
* IMAP mail access
* SMTP sending and receiving
* TLS certificates from Let's Encrypt
* Spam and abuse protections
* Modern DNS recommendations
* Web server
* Firewall configuration
* Automatic security updates
* Log rotation
* Service monitoring
* System hardening
* Sensible default configurations
* Repeatable deployments

Every component will be configurable while providing secure defaults for new users.

---

# Planned Features

## Email

* Postfix SMTP server
* Dovecot IMAP server
* SMTP authentication
* TLS encryption
* DKIM
* SPF guidance
* DMARC guidance
* Submission service
* Multiple mailbox support
* Mail aliases
* Mail forwarding
* Sieve filtering
* Optional catch-all mailbox

---

## Web

* Nginx
* Automatic HTTPS
* HTTP → HTTPS redirect
* Reverse proxy support
* Static site hosting
* Virtual hosts

---

## Security

* UFW firewall
* Fail2Ban
* Automatic security updates
* Secure SSH defaults
* Brute-force protection
* Modern TLS configuration
* Minimal exposed services
* Security headers
* File permission hardening

---

## Certificates

* Automatic Let's Encrypt certificates
* Automatic renewal
* Renewal verification
* Graceful reloads after renewal

---

## System Management

* Interactive installer
* Non-interactive mode
* Safe re-runs (idempotent)
* Configuration backups
* Health checks
* Rollback where practical
* Upgrade support
* Structured logging

---

## User Experience

The installer will guide users through only the information it cannot determine automatically, such as:

* Domain name
* Primary email account
* Administrative username
* Optional mail domains
* Optional security preferences

Everything else should be detected, validated, or configured automatically whenever possible.

---

# Supported Operating Systems

Initial support will focus exclusively on:

* Ubuntu 24.04 LTS

Future releases may support additional Ubuntu LTS versions after testing.

---

# Design Principles

This project follows several engineering principles:

* Every script should be safe to run multiple times.
* Every configuration change should be deterministic.
* Every generated file should be reproducible.
* Every major action should be logged.
* Every failure should produce a clear explanation.
* Every destructive action should require explicit confirmation.
* Every external download should be verified whenever possible.

---

# Repository Structure

```
.
├── README.md
├── install.sh
├── lib/
├── templates/
├── configs/
├── scripts/
├── tests/
├── docs/
└── LICENSE
```

As the project grows, functionality will be divided into small, focused modules instead of one large installation script.

---

# Project Status

**Current Status:** Early Development

This repository is undergoing a complete redesign.

The original repository was an experimental adaptation of an OpenBSD-based setup script. The current project is replacing that implementation with Ubuntu-native automation, improved architecture, comprehensive validation, and production-oriented engineering practices.

Until the first stable release is published, interfaces and implementation details may change significantly.

---

# Contributing

Contributions are welcome.

Areas where help is especially appreciated include:

* Ubuntu server administration
* Email infrastructure
* Security hardening
* Bash engineering
* Documentation
* Automated testing
* CI/CD
* IPv6 support
* DNS best practices

Please open an issue before beginning large architectural changes so implementation efforts can be coordinated.

---

# Roadmap

## Phase 1

* Core installer framework
* Configuration engine
* Logging
* Validation
* Package management

## Phase 2

* Email services
* TLS automation
* Firewall
* Secure defaults

## Phase 3

* Testing
* Health checks
* Upgrade path
* Backup system

## Phase 4

* Multi-domain support
* Monitoring
* Optional web dashboard
* Plugin architecture

---

# License

This project is released under the MIT License.

---

## Mission

Digital independence should not require a systems administration degree.

Get Independent exists to make self-hosting approachable without sacrificing security, reliability, or transparency.

