variable "test1" {
  description = "strange optional behavior in 1.3.3."
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
    }), null) # null != omitting default
  })
}


variable "test2" {
  description = "regression optional behavior in 1.3.4."
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

locals {
  opt_obj = lookup(var.test2, "opt_obj", null) == null ? null : merge(var.test2.opt_obj, {
    opt_map_val = var.test2.opt_map_val == null ? {} : { foo = "bar" }
  })
}
