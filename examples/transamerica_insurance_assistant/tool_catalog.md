# Insurance Assistant Tool Catalog

## Purpose

This document defines the approved tools exposed through AgentCore Gateway for the insurance assistant use case.

The Gateway acts as the governed mediation layer between the agent runtime and enterprise tools.

All tool access is subject to:

- Gateway mediation
- Cedar authorization
- scoped credential injection
- observability and audit logging

---

# Tool Categories

| Category | Purpose |
|---|---|
| Product Documentation | Search approved insurance product material |
| Underwriting Guidance | Retrieve underwriting requirements and guidance |
| Policy Comparison | Compare riders and policy features |
| Policy Summarization | Summarize approved insurance documents |
| Compliance Review | Review generated content for compliance concerns |

---

# Approved Tools

## search_product_docs

### Purpose

Search approved insurance product documentation.

### Example Use Cases

- retrieve product summaries
- search policy features
- search approved rider information

### Backend Implementation

```text
MCPified Lambda Function
```

### Example Data Sources

- approved S3 product repository
- vector database
- indexed PDF product material

### Authorization Requirements

| Requirement | Value |
|---|---|
| Role | LicensedProducer |
| License Status | Active |
| Data Classification | ApprovedProductMaterial |

### Scoped Credential Behavior

Read-only scoped credentials are injected for approved product repositories.

---

## compare_policy_riders

### Purpose

Compare approved insurance riders.

### Example Use Cases

- chronic illness rider comparison
- disability rider comparison
- premium feature comparison

### Backend Implementation

```text
MCPified Lambda Function
```

### Authorization Requirements

| Requirement | Value |
|---|---|
| Role | LicensedProducer |
| License Status | Active |

### Scoped Credential Behavior

Temporary read-only access is granted to approved rider comparison data sources.

---

## retrieve_underwriting_guidance

### Purpose

Retrieve underwriting guidance for approved workflows.

### Example Use Cases

- underwriting requirement lookup
- policy eligibility guidance
- documentation requirements

### Backend Implementation

```text
MCPified Lambda Function
```

### Authorization Requirements

| Requirement | Value |
|---|---|
| Role | UnderwritingSpecialist |
| Clearance | UnderwritingAccess |

### Scoped Credential Behavior

Restricted underwriting guidance is only accessible through temporary scoped access.

---

## summarize_policy_document

### Purpose

Generate summaries of approved policy documents.

### Example Use Cases

- summarize policy language
- simplify product explanations
- generate producer summaries

### Backend Implementation

```text
Bedrock Agent Workflow
```

### Authorization Requirements

| Requirement | Value |
|---|---|
| Role | LicensedProducer |

### Scoped Credential Behavior

The agent receives temporary read-only document access for the active workflow session.

---

# Key Architectural Insight

The agent does not directly own unrestricted access to enterprise systems.

Instead:

```text
Agent
↓
Gateway
↓
Cedar Authorization
↓
Scoped Credential Injection
↓
MCPified Tool / Lambda / API
```

This architecture prevents semantic tool relevance from bypassing authorization controls.

---

# Staff-Level Summary

The tool catalog translates business capabilities into governed AI-accessible functions.

It acts as the bridge between:

- business workflows
- Gateway exposure
- Cedar authorization
- scoped downstream execution
- observability