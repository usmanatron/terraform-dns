# Terraform - OVH DNS

Terraform scripts to make changes to your OVH DNS Zones

## Application Setup

You need to following `Rights`:

| Method | Url | Notes |
| --- | --- | --- |
| GET | `/domain/*` | Read everything |
| POST | `/domain/zone/*/record` | Needed to create records |
| GET | `/domain/zone/*/record/*` | Allow all operations on DNS records |
| PUT | `/domain/zone/*/record/*` |  |
| POST | `/domain/zone/*/record/*` |  |
| DELETE | `/domain/zone/*/record/*` |  |
