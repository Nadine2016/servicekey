data "ibm_resource_group" "group" {
  name = "default"
}

resource "ibm_resource_instance" "resource_instance" {
  name              = "tf-db"
  service           = "databases-for-etcd"
  plan              = "lite"
  resource_group_id = "${data.ibm_resource_group.group.id}"
}

resource "ibm_resource_key" "resourceKey" {
  name                 = "tfkey"
  role                 = "Viewer"
  resource_instance_id = "${data.ibm_resource_instance.resource_instance.id}"

  parameters {

     service-endpoints =  "private"
  
  }
}
