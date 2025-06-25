# Optional destroy-only configuration
# Use with: terraform destroy

provider "openstack" {
  auth_url    = "http://192.168.33.8:5000/v3"
  region      = "RegionOne"
  domain_name = "default"
  tenant_id   = "656472d18ce84b95b16ee41bc6a36aac"
  user_name   = "admin"
  password    = "3hspassw0rd"
}

resource "openstack_compute_instance_v2" "test_vm" {
  name      = "terraform-vm"
  image_id  = "8ed84cb4-0533-4efc-a4bc-5bbd3dc2a787"
  flavor_id = "ddbc4ef2-4575-44d7-92fc-c7afc41ed4f9"

  lifecycle {
    prevent_destroy = false
  }
}
