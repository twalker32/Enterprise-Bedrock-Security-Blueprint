# Insurance Assistant Access Matrix

## Purpose

This access matrix maps user roles to approved tools and access boundaries.

It demonstrates how Gateway and Cedar policies can govern which tools are discoverable or invokable by different principals.

## Roles

| Role | Description |
|---|---|
| LicensedProducer | Insurance producer with active license |
| UnderwritingSpecialist | User with restricted underwriting access |
| ComplianceReviewer | User responsible for reviewing compliance-sensitive outputs |
| SupportUser | General support user with limited read access |

## Tool Access Matrix

| Tool | LicensedProducer | UnderwritingSpecialist | ComplianceReviewer | SupportUser |
|---|---|---|---|---|
| search_product_docs | Allowed | Allowed | Allowed | Allowed |
| compare_policy_riders | Allowed | Allowed | Allowed | Denied |
| retrieve_underwriting_guidance | Limited | Allowed | Allowed | Denied |
| retrieve_restricted_underwriting_notes | Denied | Allowed | Denied | Denied |
| summarize_policy_document | Allowed | Allowed | Allowed | Limited |
| generate_client_summary | Allowed | Limited | Review Only | Denied |

## Example Tool Authorization Logic

A licensed producer may search approved product documentation and compare policy riders.

A licensed producer may not retrieve restricted underwriting notes.

An underwriting specialist may access restricted underwriting tools when the required clearance is present.

A support user may only access general approved product material.

## Security Interpretation

This matrix supports:

- least privilege
- separation of duties
- tool-level authorization
- context-aware access
- policy-as-code mapping

## Relationship to Cedar

This matrix can be translated into Cedar policies that evaluate:

- principal role
- license status
- region
- clearance level
- requested tool
- data classification

## Staff-Level Summary

The access matrix turns business roles into enforceable authorization logic.

It helps bridge business requirements, Gateway tool governance, and Cedar policy-as-code.