# Global Guardrails SCP

## Purpose

This SCP establishes organization-wide guardrails for Amazon Bedrock usage.

The policy denies Bedrock activity outside approved AWS Regions.

## Why This Matters

Enterprise AI deployments often require strict control over:

- data residency
- regulatory boundaries
- approved AI service regions
- operational governance

Without organization-level restrictions, workloads may accidentally invoke models or process data in unapproved regions.

## Security Principle

This policy demonstrates:

- organization-level governance
- preventative control enforcement
- defense-in-depth
- policy-as-code

## Key Architectural Insight

SCPs define the maximum permission boundary for accounts and workloads inside the AWS Organization.

Even if an IAM role allows Bedrock access, the SCP still prevents usage outside approved regions.

## Example SCP

```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "DenyBedrockOutsideApprovedRegions",
      "Effect": "Deny",
      "Action": [
        "bedrock:*"
      ],
      "Resource": "*",
      "Condition": {
        "StringNotEquals": {
          "aws:RequestedRegion": [
            "us-east-1",
            "us-east-2",
            "us-west-2"
          ]
        }
      }
    }
  ]
}
```

## Control Boundary

SCPs answer the question:

> "What should never be allowed anywhere in the AWS organization?"