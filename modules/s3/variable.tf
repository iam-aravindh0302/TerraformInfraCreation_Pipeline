variable "envs" {
  type        = string
  description = "Which environment to be created:'dev,qa,production'"
}

variable "bucket_count" {
  type        = string
  description = "Total buckets to be created"
}