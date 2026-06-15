# Secure Bedrock Reference Architecture

## Purpose

This reference architecture explains how enterprise Bedrock and AgentCore workloads can be secured using layered control boundaries.

The architecture is designed to demonstrate policy-as-code, least privilege, governed tool access, identity-aware authorization, scoped credential injection, memory protection, and observability.

---

## High-Level Architecture

```text
Producer / User
   ↓
Identity Federation
   ↓
AgentCore Runtime
   ↓
AgentCore Gateway
   ↓
Cedar Authorization Policy
   ↓
Scoped Credential Injection
   ↓
Approved Tools / APIs / Lambda Functions
   ↓
Approved Data Sources
   ↓
Observability / CloudWatch / SIEM
```

---

## Control Layers

| Layer | Responsibility |
|---|---|
| SCP | Defines organization-wide guardrails |
| IAM | Defines workload execution permissions |
| Runtime | Hosts and isolates the agent execution |
| Gateway | Mediates tool exposure and invocation |
| Cedar | Evaluates fine-grained tool authorization |
| Identity | Establishes user or workload context |
| Scoped Credentials | Limits downstream execution permissions |
| Memory | Separates session and identity-based context |
| Observability | Captures evidence of agent behavior |

---

## Secure Execution Flow

```text
1. User authenticates through enterprise identity federation.
2. Identity context is passed to the agent workflow.
3. AgentCore Runtime hosts the agent and maintains session isolation.
4. The agent requests a tool through AgentCore Gateway.
5. Gateway evaluates the request against Cedar authorization policy.
6. If denied, the tool invocation is blocked and logged.
7. If allowed, scoped credentials are injected for downstream access.
8. The approved Lambda, API, or MCP tool executes.
9. The tool returns only authorized data.
10. Observability captures identity, session, tool call, authorization result, latency, errors, and downstream activity.
```

---

## Key Security Concepts

### Organization Boundary

SCPs define what should never be allowed across the AWS organization.

Example:

- deny Bedrock usage outside approved regions
- prevent disabling required logging
- restrict unsupported service use

### Workload Boundary

IAM policies define what the agent runtime can execute.

Example:

- invoke approved Bedrock models
- read approved knowledge-base data
- write logs to approved destinations

### Tool Boundary

Gateway and Cedar define which tools the agent can discover or invoke.

Example:

- producer can search approved product docs
- producer cannot retrieve restricted underwriting notes
- underwriting specialist can access restricted underwriting guidance

### Downstream Boundary

Scoped credentials constrain what the approved tool execution can access.

Example:

- temporary read-only access to approved S3 documents
- no standing broad access to customer databases
- credentials expire after use

### Evidence Boundary

Observability proves what happened.

Example:

- who invoked the agent
- what session was used
- which tool was requested
- whether authorization allowed or denied the request
- what downstream service was accessed

---

## Insurance Assistant Reference Flow

```text
Licensed Producer
   ↓
Authenticates through identity provider
   ↓
AgentCore Runtime hosts insurance assistant
   ↓
Agent requests search_product_docs
   ↓
Gateway mediates request
   ↓
Cedar verifies role, license status, region, and data classification
   ↓
Scoped credentials provide temporary read-only S3 access
   ↓
Approved product documentation is retrieved
   ↓
Agent summarizes response
   ↓
CloudWatch and SIEM capture audit evidence
```

---

## Staff-Level Summary

This architecture separates responsibility across multiple control layers.

SCPs govern the organization.

IAM governs the workload.

Runtime governs execution isolation.

Gateway governs tool mediation.

Cedar governs authorization decisions.

Scoped credentials govern downstream access.

Memory governs context persistence.

Observability governs evidence and auditability.