###################################
# Setting AWS Connect
###################################
resource "aws_connect_instance" "degenxsoft" {
  name        = var.instance_name
  description = var.instance_description
  inbound_calls_enabled = var.inbound_calls_enabled
  outbound_calls_enabled = var.outbound_calls_enabled

  tags = {
    Name = "MyConnectInstanceTag"
  }
}


resource "aws_connect_quick_connect" "degenxsoft" {
  instance_id = aws_connect_instance.degenxsoft.id
  name        = var.quick_connect_name
  description = var.quick_connect_description
  contact_flow_id = var.contact_flow_id # Replace with your actual contact flow ID
  queue_id = var.queue_id # Replace with your actual queue ID
}

resource "aws_connect_routing_profile" "degenxsoft" {
  instance_id = aws_connect_instance.degenxsoft.id
  name        = var.routing_profile_name
  description = var.routing_profile_description
  default_outbound_queue_id = var.queue_id # Replace with your actual queue ID

  queues = [
    var.queue_id, # Replace with your actual queue ID
  ]
}

resource "aws_connect_user" "degenxsoft" {
  instance_id       = aws_connect_instance.degenxsoft.id
  username          = var.username
  routing_profile_id = aws_connect_routing_profile.degenxsoft.id

  identity_info {
    first_name = "John"
    last_name  = "Doe"
  }

  phone_config {
    phone_type = var.phone_type
  }

  security_profile_ids = var.security_profile_ids
}
