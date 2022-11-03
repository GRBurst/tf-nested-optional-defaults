variable "test1" {
  description = "strange optional behavior."
  type = object({
    obj = object({
      str_val = string
      opt_str_val = optional(string)
      opt_str_val_default = optional(string, "huhu")
    })
    opt_obj = optional(object({
      str_val = string
      opt_str_val = optional(string)
      opt_str_val_default = optional(string, "huhu")
    }), null)
  })
}


variable "test2" {
  description = "strange optional behavior."
  type = object({
    obj = object({
      str_val = string
      opt_str_val = optional(string)
      opt_str_val_default = optional(string, "huhu")
    })
    opt_obj = optional(object({
      str_val = string
      opt_str_val = optional(string)
      opt_str_val_default = optional(string, "huhu")
      opt_map_val = optional(map(string))
    })) //default {} not working, since str_val required
  })
}

# locals {
#   opt_obj = lookup(var.test2, "opt_obj", null) == null ? null : merge(var.test2.opt_obj, {
#     opt_map_val = var.test2.opt_map_val == null ? {} : { foo = "bar" }
#   })
# }
