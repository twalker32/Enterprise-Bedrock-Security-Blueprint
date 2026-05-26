# Least Privilege IAM

## Purpose

This IAM policy defines the least-privileged execution permissions for a Bedrock AgentCore workload.

The policy limits what the agent runtime can do inside the approved AWS environment.

## Why This Matters

SCPs establish the organization-wide boundary, but IAM defines what a specific workload is allowed to perform.

For an enterprise AI agent, IAM should prevent the runtime from having broad access to:

- all Bedrock models
- all S3 buckets
- IAM administration
- unapproved logs or telemetry destinations
- unrelated AWS services

The agent should only receive the permissions required for its assigned function.

## Security Principle

This policy demonstrates:

- least privilege
- workload-specific permissions
- explicit model invocation control
- approved knowledge-base access
- controlled logging permissions

## Key Architectural Insight

IAM defines the workload execution boundary.

Even if the AWS organization allows Bedrock usage in an approved region, the agent runtime still needs IAM permission to invoke a model, read approved data, and write logs.

SCPs answer:

> "What should never be allowed in the organization?"

IAM answers:

> "What can this specific workload do?"

## Example IAM Policy

```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "AllowApprovedBedrockModelInvocation",
      "Effect": "Allow",
      "Action": [
        "bedrock:InvokeModel",
        "bedrock:InvokeModelWithResponseStream"
      ],
      "Resource": [
        "arn:aws:bedrock:us-east-1::foundation-model/anthropic.claude-3-5-sonnet-20240620-v1:0"
      ]
    },
    {
      "Sid": "AllowReadApprovedKnowledgeBaseData",
      "Effect": "Allow",
      "Action": [
        "s3:GetObject"
      ],
      "Resource": [
        "arn:aws:s3:::approved-insurance-knowledge-base/*"
      ]
    },
    {
      "Sid": "AllowWriteAgentLogs",
      "Effect": "Allow",
      "Action": [
        "logs:CreateLogStream",
        "logs:PutLogEvents"
      ],
      "Resource": [
        "arn:aws:logs:us-east-1:123456789012:log-group:/aws/bedrock/agentcore/insurance-assistant:*"
      ]
    }
  ]
}
```

## What This Policy Allows

This policy allows the agent runtime to:

- invoke one approved Bedrock foundation model
- stream responses from that approved model
- read approved insurance knowledge-base objects from S3
- write execution logs to an approved CloudWatch log group

## What This Policy Does Not Allow

This policy does not allow the agent runtime to:

- invoke every Bedrock model
- access all S3 buckets
- create or modify IAM users, roles, or policies
- delete logs
- write to unapproved logging destinations
- administer Bedrock resources broadly

## Control Boundary

IAM controls the permissions of the workload itself.

In this architecture, the IAM execution role is attached to the agent runtime, not the human user directly.

The agent runtime should only receive the permissions needed to perform its approved business function.

## Enterprise Interpretation

In the insurance assistant use case, this means the agent can invoke an approved model, retrieve approved insurance product documentation, and write logs.

It cannot independently access unrelated customer data, invoke unapproved models, or perform administrative actions.

## Staff-Level Summary

IAM operationalizes least privilege at the workload layer.

The SCP defines the outer organizational boundary, while IAM defines the inner execution boundary for the agent runtime.