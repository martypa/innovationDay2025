##################################################################################
### Compute Instance #############################################################
##################################################################################
module "selfserv_instance_TEST2345" {
  source = "git::https://gitlab.gcp.fenaco.com/templates/terraform-modules/terraform-gcp-project-compute.git//instance?ref=v1.0.8"
  # Variables
  project_id            = local.project_id
  company               = local.company
  project               = local.project
  environment           = local.environment
  zone                  = local.zone
  region                = local.region
  disk_policies         = []
  service_account_email = module.service_account["gce"].service_account.email
  name                  = "TEST2345"
  machine_type          = "e2-standard-4"
  os                    = "rhel-10-v20251111"
  disk_type             = "pd-standard"
  disk_size             = 100
  subnetwork            = "projects/${local.sharedvpc_project_id}/regions/${local.region}/subnetworks/${local.sharedvpc_vm_subnet_name}"
  address               = "10.168.62.20"
  deletion_protection   = false
  enable_display        = true
  tags                  = []
  startup-script        = ""
  ssh-keys              = ""
  oslogin_members       = ["user:gia-manuel.regli@myfencloud.com"]
  labels = {
    owner = "TEST"
    psp = "etc"
  }
}

