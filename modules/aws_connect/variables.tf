variable "instance_name" {
  description = "Name instance_name"
  type        = string
  default     = ""
}

variable "instance_description" {
  description = "The instance_description"
  type        = string
  default     = ""
}

variable "inbound_calls_enabled" {
  description = "The inbound_calls_enabled"
  type        = bool
  default     = true
}

variable "outbound_calls_enabled" {
  description = "The outbound_calls_enabled"
  type        = bool
  default     = true
}

variable "quick_connect_name" {
  description = "quick_connect_name"
  type        = string
  default     = false
}

variable "quick_connect_description" {
  description = "quick_connect_description"
  type        = string
  default     = ""
}

variable "routing_profile_name" {
  description = " routing profile name"
  type        = string
  default     = ""
}

variable "routing_profile_description" {
  description = "routing_profile_description"
  type        = string
  default     = ""
}

variable "contact_flow_id" {
  description = "contact_flow_id"
  type        = string
  default     = ""
}

variable "queue_id" {
  description = " queue_id"
  type        = string
  default     = ""
}

variable "username" {
  description = "username"
  type        = string
  default     = ""
}

variable "phone_type" {
  description = "phone_type"
  type        = string
  default     = ""
}

variable "security_profile_ids" {
  description = "list of security_profile_ids"
  type        = list(string)
  default     = []
}
