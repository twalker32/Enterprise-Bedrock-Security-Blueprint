# Memory Data Protection

## Purpose

Memory data protection ensures that agent context, user preferences, workflow state, and long-term memory are isolated and governed.

Memory is not just chat history. It can become a sensitive persistence layer.

## Why This Matters

Agentic systems may remember:

- user preferences
- prior conversations
- workflow state
- customer context
- case summaries
- tool outputs
- business decisions

If memory is not properly segmented, agents may leak information across users, sessions, or business units.

## Security Principle

This control demonstrates:

- session isolation
- identity-based memory access
- retention control
- data minimization
- privacy-aware design
- memory governance

## Short-Term Memory

Short-term memory is session-scoped.

It supports:

- active conversation context
- temporary workflow state
- recent tool outputs
- in-progress task continuity

Short-term memory is typically associated with:

```text
session_id
```

Short-term memory answers:

> "What is happening in this current interaction?"

## Long-Term Memory

Long-term memory is identity-associated.

It supports:

- user preferences
- durable facts
- recurring workflows
- prior summaries
- historical interaction context

Long-term memory is typically associated with:

```text
actor_id / authenticated identity
```

Long-term memory answers:

> "What should the agent remember across sessions?"

## Key Architectural Insight

Short-term memory should not automatically become long-term memory.

Long-term memory should require governance, retention controls, and identity association.

## Example Insurance Scenario

The insurance assistant may temporarily remember that a producer is comparing two riders during an active session.

That is short-term memory.

The assistant may also remember that a producer prefers concise product comparison summaries.

That may be long-term memory.

However, the assistant should not permanently store sensitive client details unless explicitly approved and governed.

## Control Boundary

Memory protection answers:

> "How do we prevent context leakage and unauthorized persistence?"

## Staff-Level Summary

Short-term memory is session-scoped.

Long-term memory is identity-scoped.

Both require governance because memory can contain sensitive business context.