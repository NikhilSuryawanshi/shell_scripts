#!/bin/bash
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi
echo "------Pre requisite------"
echo "Adding gitlab runner Repository"
curl -L https://packages.gitlab.com/install/repositories/runner/gitlab-runner/script.deb.sh | bash
echo "Installing gitlab runner"
apt-get install gitlab-runner -y
echo "Adding gitlab user to sudoers"
echo "gitlab-runner ALL=(ALL) NOPASSWD: ALL" | cat > /etc/sudoers.d/gitlab
echo "Installing Docker"
apt-get install docker.io -y
echo "------Completed------"
echo "Run Below command"
echo "sudo gitlab-runner register"
echo "After registering read shell script"

# if you get error in docker so After config completion 
# edit /etc/gitlab-runner/config.toml
#   [runners.docker]
#     tls_verify = false
#     image = "google/cloud-sdk"
#     privileged = true
#     disable_entrypoint_overwrite = false
#     oom_kill_disable = false
#     disable_cache = false
#     volumes = ["/cache","/var/run/docker.sock:/var/run/docker.sock", "/srv/gitlab-runner/config/certs:/etc/gitlab-runner/certs"]
#     shm_size = 0
