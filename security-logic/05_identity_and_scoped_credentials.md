# Identity and Scoped Credentials

## Purpose

Identity establishes who or what is invoking the agent, while scoped credentials limit what downstream systems can be accessed during execution.

Together, they prevent agents from operating with broad, permanent, or shared credentials.

## Why This Matters

Enterprise agents may call tools, APIs, databases, document stores, and third-party systems.

If an agent uses a shared high-privilege credential, every user effectively inherits that access.

That creates risk across:

- data exposure
- privilege escalation
- weak audit trails
- excessive access
- lateral movement

## Security Principle

This control demonstrates:

- identity federation
- least privilege
- just-in-time access
- credential minimization
- context-aware authorization
- reduced blast radius

## Key Architectural Insight

Identity answers:

> "Who is invoking the system?"

Cedar answers:

> "Should this principal be allowed to invoke this tool?"

Scoped credentials answer:

> "What temporary downstream permissions should be granted for this execution?"

## Example Flow

```text
User authenticates
   ↓
Identity context is established
   ↓
Agent invokes requested workflow
   ↓
Gateway receives tool request
   ↓
Cedar evaluates authorization
   ↓
If allowed, scoped credentials are injected downstream
   ↓
Tool / API / Lambda executes with limited permissions
   ↓
Logs capture identity, session, action, and outcome
```

## Example Insurance Scenario

A licensed producer uses the insurance assistant to search approved product documentation.

The producer identity may include:

- role: LicensedProducer
- licenseStatus: Active
- region: Southeast
- businessUnit: LifeInsurance

The agent may request the `search_product_docs` tool.

Cedar allows the tool invocation only if the producer has the correct role, active license status, and region alignment.

If allowed, scoped credentials permit read-only access to approved product documentation.

The agent does not receive broad access to all customer records, underwriting systems, or administrative functions.

## Control Boundary

Identity establishes the principal.

Authorization policy determines whether the requested action is allowed.

Scoped credentials constrain downstream execution.

## Staff-Level Summary

Identity establishes trust.

Cedar makes the authorization decision.

Scoped credentials operationalize least privilege downstream.