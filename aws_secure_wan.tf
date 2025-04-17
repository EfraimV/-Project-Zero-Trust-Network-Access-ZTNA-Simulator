resource "aws_network_firewall" "ztna_fw" {  
  name              = "zero-trust-gateway"  
  firewall_policy_arn = aws_network_firewall_policy.ztna.arn  
  vpc_id            = module.vpc.vpc_id  
}  

resource "aws_networkfirewall_rule_group" "lateral_block" {  
  capacity = 100  
  rule {  
    action = "DROP"  
    header {  
      destination = "10.0.0.0/8"  # Block east-west traffic  
    }  
  }  
}  
