Licensed Producer
        |
        | Login
        v
Identity Provider
        |
        | Authenticated Claims
        v
AgentCore Runtime
        |
        | Request Tool
        v
AgentCore Gateway
        |
        | Authorization Check
        v
Cedar Policy
        |
        | Allow
        v
Scoped Credentials
        |
        | Temporary Access
        v
MCPified Lambda
        |
        | Read Approved Docs
        v
S3 Knowledge Base
        |
        | Response
        v
Agent
        |
        | Summarized Result
        v
Producer

(All events logged to CloudWatch/SIEM)