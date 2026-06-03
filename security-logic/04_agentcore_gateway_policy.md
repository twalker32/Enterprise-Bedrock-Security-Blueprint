# AgentCore Gateway and Tool Authorization

## Purpose

AgentCore Gateway acts as the governed tool access layer for agentic AI workloads.

It exposes approved tools to agents while enforcing mediation, authorization, and downstream access boundaries.

## Why This Matters

Agents should not receive unrestricted direct access to enterprise systems.

Instead, internal APIs, Lambda functions, REST services, and other tools should be exposed through a governed Gateway layer.

This allows the organization to control:

- which tools are discoverable
- which tools are invokable
- which identity context is required
- which policies apply before execution
- which scoped credentials are used downstream

## Security Principle

This control demonstrates:

- governed tool mediation
- fine-grained authorization
- least privilege
- separation of duties
- defense-in-depth

## Key Architectural Insight

Gateway is the tool control plane.

Cedar is the authorization decision layer.

Scoped credentials operationalize least privilege during downstream execution.

## Gateway Flow

```text
Agent requests tool
   ↓
Gateway receives request
   ↓
Identity context is evaluated
   ↓
Cedar policy evaluates authorization
   ↓
Allowed or denied
   ↓
If allowed, scoped credential is used
   ↓
Downstream Lambda / API / MCP tool executes
   ↓
Observability captures the event
```

## Example

An insurance assistant may have access to the following tools:

- search_product_docs
- retrieve_underwriting_guidance
- compare_policy_riders
- summarize_policy_document

The agent may semantically identify a relevant tool, but semantic relevance does not equal authorization.

Gateway must still evaluate whether the authenticated principal is allowed to invoke that tool.

## Control Boundary

Gateway answers:

> "How are tools securely exposed to agents?"

Cedar answers:

> "Is this principal authorized to invoke this tool under this context?"

Scoped credentials answer:

> "What limited downstream permissions should be granted for this execution?"

## Enterprise Interpretation

In the insurance assistant use case, a licensed producer may be allowed to search approved product documentation but denied access to restricted underwriting notes or customer records outside their scope.

The agent does not bypass authorization because it selected a relevant tool.

## Staff-Level Summary

Gateway mediates tool access.

Cedar authorizes tool invocation.

Scoped credentials constrain downstream execution.

Together, these controls prevent agents from becoming overprivileged access paths into enterprise systems.