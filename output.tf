output "mesos_agent_sg" {
  value = "${aws_security_group.mesos_agent.id}"
}
output "mesos_server_sg" {
  value = "${aws_security_group.mesos_server.id}"
}
output "dcos_bootstrap_id" {
  value = "${aws_instance.dcos_bootstrap.id}"
}
output "dcos_master0_id" {
  value = "${aws_instance.dcos_master0.id}"
}
output "dcos_master0_priv_ip" {
  value = "${aws_instance.master0.private_ip}"
}
output "dcos_master0_pub_ip" {
  value = "${aws_instance.master0.public_ip}"
}
output "dcos_agent0_id" {
  value = "${aws_instance.dcos_agent0.id}"
}
output "dcos_agent0_ip" {
  value = "${aws_instance.dcos_agent0.private_ip}"
}
output "dcos_agent1_id" {
  value = "${aws_instance.dcos_agent1.id}"
}
output "dcos_agent1_ip" {
  value = "${aws_instance.dcos_agent1.private_ip}"
}
output "dcos_agent2_id" {
  value = "${aws_instance.dcos_agent2.id}"
}
output "dcos_agent2_ip" {
  value = "${aws_instance.dcos_agent2.private_ip}"
}

