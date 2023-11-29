resource "aws_iam_group" "group1" {
  name = "DevOps"

}

resource "aws_instance" "name" {
  ami           = data.aws_ami.ami1.id
  instance_type = "t2.micro"
  key_name      = aws_key_pair.ec2_key.key_name

  depends_on = [aws_key_pair.ec2_key, aws_iam_group.group1]

  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file("week12a.pem")
    host        = self.public_ip
  }

  provisioner "local-exec" {
    command = "echo hello world"

  }

  provisioner "remote-exec" {
    inline = [
      "sudo yum update -y",
      "mkdir Eric",
      "pwd",
      "nproc"
    ]

  }

  provisioner "file" {
    source      = "week12a.pem"
    destination = "/tmp/w.pem"

  }
}
