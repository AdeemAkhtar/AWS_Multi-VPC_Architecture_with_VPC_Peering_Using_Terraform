# User data for Primary EC2 instance
locals {
  primary_user_data = <<-EOF
    #!/bin/bash

    dnf update -y
    dnf install -y httpd

    systemctl enable httpd
    systemctl start httpd

    echo "<h1>Primary VPC Instance - ${var.primary}</h1>" > /var/www/html/index.html
    echo "<p>Private IP: $(hostname -I)</p>" >> /var/www/html/index.html
    EOF

  # User data for Secondary EC2 instance
  secondary_user_data = <<-EOF
    #!/bin/bash

    dnf update -y
    dnf install -y httpd

    systemctl enable httpd
    systemctl start httpd

    echo "<h1>Secondary VPC Instance - ${var.secondary}</h1>" > /var/www/html/index.html
    echo "<p>Private IP: $(hostname -I)</p>" >> /var/www/html/index.html
    EOF
}