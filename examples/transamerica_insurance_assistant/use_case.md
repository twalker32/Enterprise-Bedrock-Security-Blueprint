# Secure Insurance Assistant Use Case

## Purpose

This use case demonstrates how an enterprise insurance assistant can be secured using layered policy-as-code controls.

The assistant helps authorized producers search approved insurance product documentation, retrieve underwriting guidance, compare riders, and summarize policy information.

## Business Problem

Insurance producers often need to search across product documents, rider descriptions, underwriting notes, and policy material.

This information may be spread across multiple systems and documents.

A governed AI assistant can improve speed and consistency while maintaining security, authorization, and auditability.

## Assistant Capabilities

The assistant may support:

- product document search
- rider comparison
- underwriting guidance retrieval
- policy document summarization
- producer workflow support
- client-facing summary drafting

## Security Requirements

The assistant must not receive unrestricted access to enterprise systems.

Access must be governed through:

- organization-wide SCP guardrails
- workload IAM permissions
- Gateway-mediated tool access
- Cedar authorization policies
- identity federation
- scoped downstream credentials
- memory protection
- observability and audit logging

## Example User

```text
Role: LicensedProducer
Region: Southeast
License Status: Active
Business Unit: Life Insurance
```

## Example Prompt

```text
Compare two approved life insurance riders and summarize which one may better fit a client looking for chronic illness protection.
```

## Secure Execution Flow

```text
Producer authenticates
   ↓
Identity context is established
   ↓
AgentCore Runtime hosts the assistant
   ↓
Agent requests relevant tool
   ↓
Gateway mediates tool access
   ↓
Cedar evaluates tool authorization
   ↓
Scoped credentials allow approved read-only access
   ↓
Tool retrieves approved documentation
   ↓
Agent generates governed response
   ↓
Observability captures the session and tool activity
```

## Important Boundary

The assistant supports producer education and workflow acceleration.

It does not replace:

- licensed professional judgment
- underwriting approval
- suitability review
- compliance review
- carrier-specific policy requirements

## Staff-Level Summary

This use case demonstrates how agentic AI can support insurance workflows while preserving enterprise security principles such as least privilege, identity-aware authorization, governed tool access, memory isolation, and auditability.