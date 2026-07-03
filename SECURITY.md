# Security Policy

## Security Model

**Domain Hunter Pro** runs entirely on your local machine. It does not collect telemetry, log queries, or transmit details of the domains you search to any third-party databases (avoiding front-running/domain hijacking risks).

The script only interacts with:
1. **rdap.org:** An open, public RDAP gateway to query registrar details.
2. **Standard WHOIS servers:** Queried via the local system's `whois` client tool when falling back from RDAP.

## Supported Versions

We actively support the latest release of Domain Hunter Pro. Please update to the latest commit before reporting issues.

| Version | Supported |
| ------- | --------- |
| v1.0.x  | Yes       |
| < v1.0  | No        |

## Reporting a Vulnerability

If you discover a security vulnerability (such as a command injection hazard through unescaped user input), please do **NOT** open a public issue. Instead, report it privately to the author:

* **Email:** [debashishbordoloi007@gmail.com](mailto:debashishbordoloi007@gmail.com)

We will investigate the report and release a patch as soon as possible.
