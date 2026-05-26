# Enterprise Bedrock Security Blueprint

This repository demonstrates how policy-as-code can enforce secure, scalable deployment of enterprise Amazon Bedrock and AgentCore workloads.

The goal is to show how multiple security control layers work together to govern agentic AI systems at scale.

## Core Thesis

Enterprise AI security is not enforced by one control. It is enforced through layered policy boundaries that govern:

- what an AWS organization allows
- what an agent runtime can execute
- which tools an agent can discover or invoke
- how downstream credentials are scoped
- how activity is logged, traced, and audited

## Control Plane Model

```text
User / Workload
   ↓
Identity Federation
   ↓
AgentCore Runtime
   ↓
AgentCore Gateway
   ↓
Cedar Policy Evaluation
   ↓
Scoped Credential Injection
   ↓
Downstream Tools / APIs / Lambda Functions
   ↓
Observability and Audit Logging
```

## Security Layers

| Layer | Question It Answers | Control Purpose |
|---|---|---|
| SCP | What should never be allowed in the AWS organization? | Organization-wide guardrails |
| IAM | What can this workload do? | Least-privilege execution |
| Gateway | How are tools exposed to agents? | Governed tool mediation |
| Cedar | Can this principal invoke this tool? | Fine-grained tool authorization |
| Identity | Who is invoking the system? | Authentication and user/workload context |
| Scoped Credentials | What downstream permissions are granted? | Temporary least-privilege execution |
| Observability | How do we prove what happened? | Auditability, detection, and troubleshooting |

## Example Use Case

The reference use case is a secure insurance assistant. The assistant helps an authorized producer:

- search approved product documentation
- retrieve underwriting guidance
- compare policy riders
- summarize insurance policy information

The agent does not receive unrestricted access.

Access is governed through:

- organization-wide SCP guardrails
- workload IAM permissions
- AgentCore Gateway mediation
- Cedar tool authorization policies
- scoped downstream credentials
- observability and audit logging

---

## Repository Structure

```text
Enterprise-Bedrock-Security-Blueprint/
├── README.md
├── architecture/
├── security-logic/
├── policies/
└── examples/
```
---

## What This Proves

This repository demonstrates understanding of secure AI deployment at scale through:

- policy-as-code
- least privilege
- identity-aware authorization
- governed agent-to-tool access
- scoped credential brokering
- audit-ready observability
- memory and data protection
